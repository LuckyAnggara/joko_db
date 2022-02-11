<?php

namespace App\Http\Controllers;

use App\Models\Bidang;
use App\Models\Jabatan;
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
use App\Models\PerjadinRealisasiLainnya;
use App\Models\PerjadinRealisasiLampiran;
use App\Models\PerjadinRealisasiUangHarian;
use App\Models\PerjadinRealisasiUangHotel;
use App\Models\PerjadinRealisasiTransport;
use App\Models\PerjadinSusunanTim;
use App\Models\Provinsi;
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
            $value->provinsi = Provinsi::find($value->provinsi_id);
            // DETAIL SUSUNAN TIM
            foreach ($value->susunan_tim as $key => $tim) {
                $tim->pegawai = Pegawai::find($tim->pegawai_id);
                $tim->pegawai['jabatan'] = Jabatan::find($tim->pegawai['jabatan_id']);
                $tim->anggaran = PerjadinRAB::find($tim->perjadin_rab_id);
                $tim->realisasi = PerjadinRealisasi::find($tim->perjadin_realisasi_id);
                if($tim->realisasi){
                    $tim->realisasi['lampiran'] = PerjadinRealisasiLampiran::where('perjadin_realisasi_id', $tim->realisasi['id'])->get();
                    $tim->realisasi['uang_harian'] = PerjadinRealisasiUangHarian::where('perjadin_realisasi_id', $tim->realisasi['id'])->get();
                    $tim->realisasi['uang_hotel'] = PerjadinRealisasiUangHotel::where('perjadin_realisasi_id', $tim->realisasi['id'])->get();
                    $tim->realisasi['transport'] = PerjadinRealisasiTransport::where('perjadin_realisasi_id', $tim->realisasi['id'])->get();
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

    public function indexPegawaiBelumRealisasi(Request $payload){
        $tahun_id = $payload->tahun;

        $master = PerjadinSusunanTim::where('status_realisasi','SUDAH')->get();
        foreach ($master as $key => $value) {
            $perjadin = Perjadin::find($value->perjadin_id);
            $diff=strtotime($perjadin->tanggal_kembali,'Y-m-d');

            $value->diff=$diff;
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
                'provinsi_id'=> $request->umum['provinsi']['id'],
                'tahun_id' => $request->tahun['id'],
                'keberangkatan'=> $request->umum['keberangkatan'],
                'output'=> $request->umum['output'],
                'status'=> 'RENCANA',
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
                    'status_realisasi'=> 'BELUM',
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

        $this->hapusRealisasi($request->perjadin['id']);
        
        $output = [];
        $total_realisasi = 0;
        $master = Perjadin::find($request->perjadin['id']);
        foreach ($request->realisasi as $key => $realisasi) {
            $tim = PerjadinSusunanTim::find($realisasi['pegawai']['susunan_tim_id']);
            if($tim){
                $a = PerjadinRealisasi::create([
                    'perjadin_id' => $request->perjadin['id'],
                    'susunan_tim_perjadin_id' => $realisasi['pegawai']['susunan_tim_id'],
                    'total_harian'=> $realisasi['total_harian'],
                    'total_hotel'=> $realisasi['total_hotel'],
                    'total_transport'=> $realisasi['total_transport'],
                    'representatif'=> $realisasi['representatif'],
                    'taksi_jakarta'=> $realisasi['taksi_jakarta'],
                    'taksi_provinsi'=> $realisasi['taksi_provinsi'],
                    'jakarta_riil'=> $realisasi['jakarta_riil'],
                    'provinsi_riil'=> $realisasi['provinsi_riil'],
                    'total'=>$realisasi['total'],
                    'tanggal_berangkat'=> $realisasi['tanggal_berangkat'],
                    'tanggal_kembali'=> $realisasi['tanggal_kembali'],
                ]);

                if($a){
                    foreach ($realisasi['uang_harian'] as $key => $uang_harian) {

                        $b = PerjadinRealisasiUangHarian::create([
                            'perjadin_realisasi_id' => $a->id,
                            'jumlah_hari' => $uang_harian['jumlah_hari'],
                            'uang_harian' => $uang_harian['uang_harian'],
                            'total' => $uang_harian['jumlah_hari'] * $uang_harian['uang_harian'],
                            'riil' => $uang_harian['hari_riil'],
                        ]);


                  
                    }
                    foreach ($realisasi['uang_hotel'] as $key => $uang_hotel) {

                        $c = PerjadinRealisasiUangHotel::create([
                            'perjadin_realisasi_id' => $a->id,
                            'jenis_hotel' => $uang_hotel['jenis_hotel'],
                            'nama_hotel' => $uang_hotel['nama_hotel'],
                            'jumlah_malam' => $uang_hotel['jumlah_malam'],
                            'uang_hotel' => $uang_hotel['uang_hotel'],
                            'total' => $uang_hotel['jumlah_malam'] * $uang_hotel['uang_hotel'],
                            'riil' => $uang_hotel['hotel_riil'],
                        ]);
                    }
                    foreach ($realisasi['transport'] as $key => $transport) {

                        $d = PerjadinRealisasiTransport::create([
                            'perjadin_realisasi_id' => $a->id,
                            'jenis_transport' => $transport['jenis_transport'],
                            'total' => $transport['total'],
                            'riil' => $transport['transport_riil'],
                            'nomor_tiket' => $transport['nomor_tiket'],
                            'nomor_flight' => $transport['nomor_flight'],
                            'jam' => $transport['jam'],
                            'no_tempat_duduk' => $transport['no_tempat_duduk'],
                            'tanggal' => $transport['tanggal'],
                            'keterangan' => $transport['keterangan'],
                            'asal' => $transport['asal'],
                            'tujuan' => $transport['tujuan'],
                        ]);
                    }


                    $total_realisasi += $a['total'];

                    $master->total_realisasi = $total_realisasi;
                    $master->status_realisasi = 'SUDAH';
                    $master->save();
                    
                    $tim->perjadin_realisasi_id = $a->id;
                    $tim->save();

                    $output[]= $a;
                }
                $tim->status_realisasi = 'SUDAH';
                $tim->save();
            }
        }
        return response()->json($output, 200);
       
    }

    public function uploadPerjadinRealisasiLampiran(Request $payload){
        $output = [];
        $id = $payload->id;
        $user_id = $payload->user_id;

        if($payload->file('lampiran_harian')){
            foreach ($payload->file('lampiran_harian') as $file) {
            $path = Storage::disk('public')->put('perjadin/lampiran/harian',$file);
            $nama = $file->getClientOriginalName();
            $data = PerjadinRealisasiLampiran::create([
                'perjadin_realisasi_id' => $id,
                'jenis'=>'HARIAN',
                'nama' => 'HARIAN_'.$nama,
                'file' => $path,
                'user_id' => $user_id,
            ]);
            $output[] = $data;
            }
        }
        if($payload->file('lampiran_hotel')){
            foreach ($payload->file('lampiran_hotel') as $file) {
            $path = Storage::disk('public')->put('perjadin/lampiran/hotel',$file);
            $nama = $file->getClientOriginalName();
            $data = PerjadinRealisasiLampiran::create([
                'perjadin_realisasi_id' => $id,
                'jenis'=>'HOTEL',
                'nama' => 'HOTEL_'.$nama,
                'file' => $path,
                'user_id' => $user_id,
            ]);
            $output[] = $data;
            }
        }
        if($payload->file('lampiran_transport')){
            foreach ($payload->file('lampiran_transport') as $file) {
            $path = Storage::disk('public')->put('perjadin/lampiran/transport',$file);
            $nama = $file->getClientOriginalName();
            $data = PerjadinRealisasiLampiran::create([
                'perjadin_realisasi_id' => $id,
                'jenis'=>'TRANSPORT',
                'nama' =>'TRANSPORT_'. $nama,
                'file' => $path,
                'user_id' => $user_id,
            ]);
            $output[] = $data;
            }
        }
        if($payload->file('lampiran_taksi')){
            foreach ($payload->file('lampiran_taksi') as $file) {
            $path = Storage::disk('public')->put('perjadin/lampiran/taksi',$file);
            $nama = $file->getClientOriginalName();
            $data = PerjadinRealisasiLampiran::create([
                'perjadin_realisasi_id' => $id,
                'jenis'=>'TAKSI',
                'nama' =>'TAKSI_'. $nama,
                'file' => $path,
                'user_id' => $user_id,
            ]);
            $output[] = $data;
            }
        }
        if($payload->file('lampiran_representatif')){
            foreach ($payload->file('lampiran_representatif') as $file) {
            $path = Storage::disk('public')->put('perjadin/lampiran/representatif',$file);
            $nama = $file->getClientOriginalName();
            $data = PerjadinRealisasiLampiran::create([
                'perjadin_realisasi_id' => $id,
                'jenis'=>'REPRESENTATIF',
                'nama' =>'REPRESENTATIF_'. $nama,
                'file' => $path,
                'user_id' => $user_id,
            ]);
            $output[] = $data;
            }
        }
        if($payload->file('lampiran_lainnya')){
            foreach ($payload->file('lampiran_lainnya') as $file) {
            $path = Storage::disk('public')->put('perjadin/lampiran/lainnya',$file);
            $nama = $file->getClientOriginalName();
            $data = PerjadinRealisasiLampiran::create([
                'perjadin_realisasi_id' => $id,
                'jenis'=>'LAINNYA',
                'nama' => 'LAINNYA_'.$nama,
                'file' => $path,
                'user_id' => $user_id,
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
        
        $unrealisasi_kegiatan =  Kegiatan::where('mak_id',$id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)
        ->whereNotIn('status', ['SELESAI','DITOLAK'])->sum('total_anggaran');
        $unrealisasi_perjadin = Perjadin::where('mak_id',$id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->whereNotIn('status',  ['SELESAI','DITOLAK'])->sum('total_anggaran');

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

    // EDIT

    public function editPerjadinUmum(Request $payload){
        $perjadin_id = $payload->id;
        $surat_perintah_id = $payload->surat_perintah_id;

        $perjadin = Perjadin::find($perjadin_id);

        $perjadin->jumlah_hari = $payload->jumlah_hari;
        $perjadin->provinsi_id = $payload->provinsi['id'];
        $perjadin->keberangkatan = $payload->keberangkatan;
        $perjadin->tanggal_berangkat = $payload->tanggal_berangkat;
        $perjadin->tanggal_kembali = $payload->tanggal_kembali;
        $perjadin->total_anggaran = $payload->total_anggaran;
        $perjadin->maksud = $payload->maksud;
        $perjadin->output = $payload->output;
        $perjadin->tahun_id = $payload->tahun['id'];
        $perjadin->save();

        $surat_perintah = SuratPerintah::find($surat_perintah_id);
        $surat_perintah->nomor_surat = $payload->surat_perintah['nomor_surat'];
        $surat_perintah->perihal = $payload->surat_perintah['perihal'];
        $surat_perintah->tanggal_surat = $payload->surat_perintah['tanggal_surat'];
        $surat_perintah->save();

        $obrik = PerjadinObrik::where('perjadin_id', $perjadin_id)->get();
        foreach ($obrik as $key => $value) {
            $value->delete();
        }

        foreach ($payload->obrik as $key => $x) {
            PerjadinObrik::create([
                'perjadin_id' => $perjadin_id,
                'satker_id' => $x['satker']['id'],
                'urusan_id' => $x['urusan']['id'],
            ]);
        }
        return response()->json($perjadin, 200);
    }
    public function editPerjadinMak(Request $payload){

        $perjadin = Perjadin::find($payload->id);
        $perjadin->mak_id = $payload->mak['id'];
        $perjadin->save();
        return response()->json($perjadin, 200);
    }

    public function editPerjadinTim(Request $payload){
        $perjadin_id = $payload->id;

        $perjadin = Perjadin::find($payload->id);
        $perjadin->total_anggaran = $payload->total_anggaran;
        $perjadin->total_realisasi = 0;
        $perjadin->status_realisasi = 'BELUM';
        $perjadin->save();

        $susunan_tim = PerjadinSusunanTim::where('perjadin_id', $perjadin_id)->get();
        foreach ($susunan_tim as $key => $value) {
            $value->delete();
        }

        foreach ($payload->susunan_tim as $key => $tim) {
            $anggota = PerjadinSusunanTim::create([
                'perjadin_id'=> $perjadin->id,
                'pegawai_id'=> $tim['pegawai']['id'],
                'peran_id'=> $tim['peran']['id'],
                'status_realisasi'=> $tim['status_realisasi'],
            ]);

            if($anggota){
                $anggaran = PerjadinRAB::create([
                    'perjadin_id' => $perjadin->id,
                    'susunan_tim_perjadin_id' => $anggota->id,
                    'jumlah_hari'=> $tim['anggaran']['jumlah_hari'],
                    'jumlah_malam'=> $tim['anggaran']['jumlah_malam'],
                    'darat'=> $tim['anggaran']['darat'],
                    'laut'=> $tim['anggaran']['laut'],
                    'representatif'=> $tim['anggaran']['representatif'],
                    'taksi_jakarta'=> $tim['anggaran']['taksi_jakarta'],
                    'taksi_provinsi'=> $tim['anggaran']['taksi_provinsi'],
                    'uang_harian'=> $tim['anggaran']['uang_harian'],
                    'uang_hotel'=> $tim['anggaran']['uang_hotel'],
                    'udara'=> $tim['anggaran']['udara'],
                    'total'=> $tim['anggaran']['total'],
                    'tanggal_berangkat'=> $tim['anggaran']['tanggal_berangkat'],
                    'tanggal_kembali'=> $tim['anggaran']['tanggal_kembali'],
                ]);
                $anggota->perjadin_rab_id = $anggaran->id;
                $anggota->save();
            }
            
            $tim[] = $anggota;

            $perjadin->susunan_tim= $tim;
        }

        $this->hapusRealisasi($perjadin_id);




        return response()->json($perjadin, 200);
     
    }

    public function hapusRealisasi($id){
    
        $master = PerjadinRealisasi::where('perjadin_id', $id)->get();

        foreach ($master as $key => $value) {
            $value->delete();

            $realisasi_harian = PerjadinRealisasiUangHarian::where('perjadin_realisasi_id' ,$value->id)->get();
            $realisasi_hotel = PerjadinRealisasiUangHotel::where('perjadin_realisasi_id' ,$value->id)->get();
            $realsisasi_transport = PerjadinRealisasiTransport::where('perjadin_realisasi_id' ,$value->id)->get();
            $realisasi_lampiran = PerjadinRealisasiLampiran::where('perjadin_realisasi_id' ,$value->id)->get();
            $realisasi_lainnya = PerjadinRealisasiLainnya::where('perjadin_realisasi_id' ,$value->id)->get();

            foreach ($realisasi_harian as $key => $harian) {
                $harian->delete();
            }
            foreach ($realisasi_hotel as $key => $hotel) {
                $hotel->delete();
            }
            foreach ($realsisasi_transport as $key => $transport) {
                $transport->delete();
            }
            foreach ($realisasi_lampiran as $key => $lampiran) {
                $lampiran->delete();
                if (Storage::disk('public')->exists($lampiran->file)) {
                    Storage::disk('public')->delete($lampiran->file);
               }
            }
            foreach ($realisasi_lainnya as $key => $lainnya) {
                $lainnya->delete();
            }
        }
    }
}
