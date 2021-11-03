<?php

namespace App\Http\Controllers;

use App\Models\Bidang;
use App\Models\Kegiatan;
use App\Models\Mak;
use App\Models\Pegawai;
use App\Models\Peran;
use App\Models\Perjadin;
use App\Models\PerjadinLampiran;
use App\Models\PerjadinLog;
use App\Models\PerjadinObrik;
use App\Models\PerjadinRAB;
use App\Models\PerjadinRealisasi;
use App\Models\PerjadinRealisasiLampiran;
use App\Models\PerjadinSusunanTim;
use App\Models\KegiatanRealisasi;
use App\Models\Satker;
use App\Models\SuratPerintah;
use App\Models\Tahun;
use App\Models\Urusan;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\URL;


class PerjadinController extends Controller
{

    public function index(Request $payload){
        $bidang_id = $payload->input('bidang_id');
        $tahun_id = $payload->input('tahun_id');

        $master =  Perjadin::where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->get();
        if($bidang_id == 0){
            $master =  Perjadin::where('tahun_id', $tahun_id)->get();
        }
        foreach ($master as $key => $value) {
            $value->surat_perintah = SuratPerintah::find($value->surat_perintah_id);
            $value->susunan_tim = PerjadinSusunanTim::where('perjadin_id',$value->id)->get();
            $value->mak = Mak::find($value->mak_id);
            $value->mak['saldo'] = $this->cekSaldoMak($value->mak_id, $tahun_id, $bidang_id);
            $value->tahun = Tahun::find($value->tahun_id);
            // DETAIL SUSUNAN TIM
            foreach ($value->susunan_tim as $key => $tim) {
                $tim->pegawai = Pegawai::find($tim->pegawai_id);
                $tim->anggaran = PerjadinRAB::find($tim->perjadin_rab_id);
                $tim->realisasi = PerjadinRealisasi::find($tim->perjadin_realisasi_id);
                if($tim->realisasi){
                    $tim->realisasi['lampiran'] = PerjadinRealisasiLampiran::where('perjadin_realisasi_id', $tim->realisasi['id'])->get();
                }
                $tim->peran = Peran::find($tim->peran_id);
            }

            // DETAIL OBRIK
            $value->obrik = PerjadinObrik::where('perjadin_id',$value->id)->get();

            foreach ($value->obrik as $key => $obrik) {
                $obrik->satker = Satker::find($obrik->satker_id);
                $obrik->urusan = Urusan::find($obrik->urusan_id);
            }

            $value->lampiran = PerjadinLampiran::where('perjadin_id',$value->id)->get();
            foreach ($value->lampiran as $key => $lampiran) {
                $lampiran->pegawai = Pegawai::find(User::find($lampiran->user_id)->pegawai_id);
            }
            $value->bidang = Bidang::find($value->bidang_id);
            $value->user = User::find($value->user_id);
            $value->user['pegawai'] = Pegawai::find($value->user['pegawai_id']);
            $value->log = PerjadinLog::where('perjadin_id',$value->id)->orderBy('id','DESC')->get();
            foreach ($value->log as $key => $log) {
                $log->ago = $log->created_at->diffForHumans();
                $log->pegawai = Pegawai::find(User::find($log->user_id)->pegawai_id);
            }
        }

        return response()->json($master, 200);
    }

    public function destroy(Request $request){
        $id = $request->perjadin_id;

        $master = Perjadin::find($id);

        if($master){
            $master->delete();
            $surat_perintah = SuratPerintah::find($master->surat_perintah_id);
            $surat_perintah->delete();

            $log = PerjadinLog::where('perjadin_id', $master->id)->get();
            foreach ($log as $key => $log) {
                $log->delete();
            }

            $obrik = PerjadinObrik::where('perjadin_id', $master->id)->get();
            foreach ($obrik as $key => $obrik) {
                $obrik->delete();
            }

            $tim = PerjadinSusunanTim::where('perjadin_id', $master->id)->get();
            foreach ($tim as $key => $tim) {
                $tim->delete();
            }

            $rab = PerjadinRAB::where('perjadin_id', $master->id)->get();
            foreach ($rab as $key => $rab) {
                $rab->delete();
            }

            $realisasi = PerjadinRealisasi::where('perjadin_id', $master->id)->get();
            foreach ($realisasi as $key => $realisasi) {
                $realisasi->delete();
                $perjadin_realisasi = PerjadinRealisasiLampiran::where('perjadin_realisasi_id', $realisasi->id);
                foreach ($perjadin_realisasi as $key => $perjadin_realisasi) {
                    if (Storage::disk('public')->exists($perjadin_realisasi->file)) {
                        Storage::disk('public')->delete($perjadin_realisasi->file);
                   }
                }
               
            }


            $lampiran = PerjadinLampiran::where('perjadin_id', $master->id)->get();
            foreach ($lampiran as $key => $lampiran) {
                $lampiran->delete();

                
                // return $master;
                if (Storage::disk('public')->exists($lampiran->file)) {
                     Storage::disk('public')->delete($lampiran->file);
                }
            }
        }

        return response()->json($master, 200);

    }
  
    public function store(Request $request){
        $surat_perintah = SuratPerintah::create([
            'nomor_surat' => $request->surat_perintah['nomor_surat'],
            'perihal' => $request->surat_perintah['perihal'],
            'tanggal_surat' => $request->surat_perintah['tanggal_surat'],
            'perjadin' => 'YA',
            'tahun_id' => $request->tahun['id'],
            'user_id' => $request->user_data['id'],
            'bidang_id' => $request->user_data['bidang_id'],
        ]);
        if($surat_perintah){
            // ITUNG TOTAL ANGGARAN
            $total_anggaran = 0 ;
            foreach ($request->rencana_anggaran as $key => $rab) {
                $total_anggaran += $rab['total'];
            }
            $perjadin = Perjadin::create([
                'surat_perintah_id'=> $surat_perintah->id,
                'no_perjadin' => $this->generateKodePerjadin($request->user_data['bidang_id']),
                'mak_id'=> $request->umum['mak']['id'],
                'jumlah_hari'=> $request->umum['jumlah_hari'],
                'maksud'=> $request->umum['maksud'],
                'ppk_id'=> $request->umum['ppk']['id'],
                'bendahara_id'=> $request->umum['bendahara']['id'],
                'tujuan'=> $request->umum['tujuan'],
                'tahun_id' => $request->tahun['id'],
                'keberangkatan'=> $request->umum['keberangkatan'],
                'status'=> 'PENGAJUAN',
                'tanggal_berangkat'=> $request->umum['tanggal_berangkat'],
                'tanggal_kembali'=> $request->umum['tanggal_kembali'],
                'total_anggaran'=> $total_anggaran,
                'user_id' => $request->user_data['id'],
                'bidang_id' => $request->user_data['bidang_id'],
            ]);

            $perjadin->surat_perintah = $surat_perintah;
        }

        if($perjadin){
            $obrik = [];
            $tim = [];

            $this->storeLog($perjadin->id,'PENGAJUAN', 'PERJADIN TELAH DIBUAT, OLEH '.$request->user_data['pegawai']['nama'], $request->user_data,null);
            
            foreach ($request->obrik['detail'] as $key => $satker) {
                if($satker['satker'] !== null){
                    $object = PerjadinObrik::create([
                        'perjadin_id' => $perjadin->id,
                        'satker_id'=> $satker['satker']['id'],
                        'urusan_id'=> $satker['urusan']['id'],
                    ]);
                    $obrik[] = $object;
                    $perjadin->obrik = $obrik;
                }

            }

            foreach ($request->susunan_tim as $key => $tim) {
                $anggota = PerjadinSusunanTim::create([
                    'perjadin_id'=> $perjadin->id,
                    'pegawai_id'=> $tim['pegawai']['id'],
                    'peran_id'=> $tim['peran']['id'],
                ]);

                if($anggota){
                    $anggaran = PerjadinRAB::create([
                        'perjadin_id' => $perjadin->id,
                        'susunan_tim_perjadin_id' => $anggota->id,
                        'jumlah_hari'=> $request->rencana_anggaran[$key]['jumlah_hari'],
                        'jumlah_malam'=> $request->rencana_anggaran[$key]['jumlah_malam'],
                        'darat'=> $request->rencana_anggaran[$key]['darat'],
                        'laut'=> $request->rencana_anggaran[$key]['laut'],
                        'representatif'=> $request->rencana_anggaran[$key]['representatif'],
                        'taksi_jakarta'=> $request->rencana_anggaran[$key]['taksi_jakarta'],
                        'taksi_provinsi'=> $request->rencana_anggaran[$key]['taksi_provinsi'],
                        'uang_harian'=> $request->rencana_anggaran[$key]['uang_harian'],
                        'uang_hotel'=> $request->rencana_anggaran[$key]['uang_hotel'],
                        'udara'=> $request->rencana_anggaran[$key]['udara'],
                        'total'=> $request->rencana_anggaran[$key]['total'],
                        'tanggal_berangkat'=> $request->rencana_anggaran[$key]['tanggal_berangkat'],
                        'tanggal_kembali'=> $request->rencana_anggaran[$key]['tanggal_kembali'],
                    ]);
                    $anggota->perjadin_rab_id = $anggaran->id;
                    $anggota->save();

                    // $anggota->anggaran = $anggaran;
                }

                $tim[] = $anggota;

                $perjadin->susunan_tim= $tim;
            }

        }
        return response()->json($perjadin, 200);
     
    }

    public function storeRealisasi(Request $request){
        
        $output = [];
        $total_realisasi = 0;
        $master = Perjadin::find($request->perjadin['id']);
        foreach ($request->realisasi as $key => $realisasi) {
            $tim = PerjadinSusunanTim::find($realisasi['pegawai']['susunan_tim_id']);
            if($tim){
                $realisasi = PerjadinRealisasi::create([
                    'perjadin_id' => $request->perjadin['id'],
                    'susunan_tim_perjadin_id' => $realisasi['pegawai']['susunan_tim_id'],
                    'jumlah_hari'=> $realisasi['jumlah_hari'],
                    'jumlah_malam'=> $realisasi['jumlah_malam'],
                    'darat'=> $realisasi['darat'],
                    'laut'=> $realisasi['laut'],
                    'representatif'=> $realisasi['representatif'],
                    'taksi_jakarta'=> $realisasi['taksi_jakarta'],
                    'taksi_provinsi'=> $realisasi['taksi_provinsi'],
                    'uang_harian'=> $realisasi['uang_harian'],
                    'uang_hotel'=>$realisasi['uang_hotel'],
                    'udara'=> $realisasi['udara'],
                    'total'=>$realisasi['total'],
                    'jenis_hotel'=>$realisasi['jenis_hotel'],
                    'tanggal_berangkat'=> $realisasi['tanggal_berangkat'],
                    'tanggal_kembali'=> $realisasi['tanggal_kembali'],
                ]);

                if($realisasi){
                    $total_realisasi += $realisasi['total'];

                    $master->total_realisasi = $total_realisasi;
                    $master->status_realisasi = 'SUDAH';
                    $master->save();
                    
                    $tim->perjadin_realisasi_id = $realisasi->id;
                    $tim->save();

                    $output[]= $realisasi;
                }
            }
        }
        return response()->json($output, 200);
       
    }

    public function uploadPerjadinRealisasiLampiran(Request $payload){
        $output = [];
        $id = $payload->id;
        
        if($payload->file('lampiran')){
            foreach ($payload->file('lampiran') as $file) {
            $path = Storage::disk('public')->put('perjadin/lampiran',$file);
            $nama = $file->getClientOriginalName();
            $data = PerjadinRealisasiLampiran::create([
                'perjadin_realisasi_id' => $id,
                'nama' => $nama,
                'file' => $path,
            ]);
            $output[] = $data;
            }
        }
        return response()->json($output, 200);

    }

    public function uploadLampiran(Request $payload){
        $output = [];
        $id = $payload->id;
        $user_id = $payload->user_id;
        
        if($payload->file('lampiran_sp')){
            foreach ($payload->file('lampiran_sp') as $file) {
            $path = Storage::disk('public')->put('perjadin',$file);
            $nama = 'SP_'.$file->getClientOriginalName();
            $data = PerjadinLampiran::create([
                'perjadin_id' => $id,
                'jenis' => 'SP',
                'nama' => $nama,
                'file' => $path,
                'user_id' => $user_id,
            ]);
            $output[] = $data;
            }
        }

        if($payload->file('lampiran_rab')){
            foreach ($payload->file('lampiran_rab') as $file) {
            $path = Storage::disk('public')->put('perjadin',$file);
            $nama = $id.'_RAB_'.$file->getClientOriginalName();
            $data = PerjadinLampiran::create([
                'perjadin_id' => $id,
                'jenis' => 'RAB',
                'nama' => $nama,
                'file' => $path,
                'user_id' => $user_id,
            ]);
            $output[] = $data;
            }
        }

        if($payload->file('lampiran_lainnya')){
            foreach ($payload->file('lampiran_lainnya') as $file) {
                $path = Storage::disk('public')->put('perjadin',$file);
                $nama = $id.'_LAINNYA_'.$file->getClientOriginalName();
                $data = PerjadinLampiran::create([
                    'perjadin_id' => $id,
                    'jenis' => 'LAINNYA',
                    'nama' => $nama,
                    'file' => $path,
                    'user_id' => $user_id,
                ]);
                $output[] = $data;
            }
        }
       
       

        return response()->json($output, 200);
    }

    public function destroyLampiran(Request $payload){
        $id = $payload->id;

        $master = PerjadinLampiran::find($id);
        $master->delete();

        if (Storage::disk('public')->exists($master->file)) {
            Storage::disk('public')->delete($master->file);
        }
        return response()->json($master, 200);
    }

    public function downloadLampiran(Request $payload){
        $id = $payload->id;
        $jenis = $payload->jenis;
        
        $master = PerjadinLampiran::find($id);
        if($jenis == 'realisasi'){
            $master = PerjadinRealisasiLampiran::find($id);
        }
        // return $master;
        if (Storage::disk('public')->exists($master->file)) {
            return Storage::disk('public')->download($master->file);
        }

    }

    public function status(Request $request){
        $response = 404;
        $id = $request->id;
        $messages = 'ERROR';
        $master = Perjadin::find($id);

        if($master){
            $response = 200;

            $master->status =  $request->status;
            $master->save();
            $this->storeLog($master->id,$request->status_log, $request->message_log.' oleh '. $request->user_data['pegawai']['nama'], $request->user_data, $request->catatan);

            $messages = $master;


        }

        return response()->json($messages, $response);

    }

    public function storeLog($id, $status_log, $message_log, $user_data, $catatan = null){
        $log = PerjadinLog::create([
            'perjadin_id' => $id,
            'perjadin_id' => $id,
            'status' => $status_log,
            'catatan'=> $catatan,
            'bidang_id'=> $user_data['bidang_id'],
            'user_id'=> $user_data['id'],
            'keterangan' => $message_log,
        ]);
    }

    public function cekSaldoMak($id, $tahun_id, $bidang_id){

        $mak = Mak::find($id);

        $realisasi_kegiatan =  Kegiatan::where('mak_id',$id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->where('status','SELESAI')->sum('total_realisasi');
        $realisasi_perjadin = Perjadin::where('mak_id',$id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->where('status','SELESAI')->sum('total_realisasi');
        
        // $unrealisasi_kegiatan =  Kegiatan::where('mak_id',$id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)
        // ->whereIn('status', ['SELESAI','DITOLAK'])->sum('total_anggaran');
        // $unrealisasi_perjadin = Perjadin::where('mak_id',$id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->whereIn('status',  ['SELESAI','DITOLAK'])->sum('total_anggaran');

        $output['realisasi'] = $realisasi_kegiatan + $realisasi_perjadin;
        $output['unrealisasi'] = $unrealisasi_kegiatan + $unrealisasi_perjadin;
        $output['saldo'] =  $mak->pagu -  $output['realisasi'] -  $output['unrealisasi'];
        return $output;
    }

    public function generateKodePerjadin($bidang_id){
        $data = Perjadin::all();
        $output = collect($data)->last();
        $date = date("dmy");

        if($output){
            $dd = $output->no_perjadin;
            $str = explode('-', $dd);
            if($str[1] == $date){
                $last_prefix = $str[2]+ 1;
                return $bidang_id.'-'.$date.'-'.$last_prefix;
            }

            return $bidang_id.'-'.$date.'-'.'1';
           
        }
        return $bidang_id.'-'.$date.'-'.'1';      
    }
}
