<?php

namespace App\Http\Controllers;

use App\Models\Bidang;
use App\Models\JenisKegiatan;
use App\Models\Kegiatan;
use App\Models\KegiatanLampiran;
use App\Models\KegiatanLog;
use App\Models\Mak;
use App\Models\Pegawai;
use App\Models\Tahun;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class KegiatanController extends Controller
{

    public function index(Request $payload){
        $bidang_id = $payload->input('bidang_id');
        $tahun_id = $payload->input('tahun_id');

        $master =  Kegiatan::where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->get();
        if($bidang_id == 0){
            $master =  Kegiatan::where('tahun_id', $tahun_id)->get();
        }

        foreach ($master as $key => $value) {
            $value->mak = Mak::find($value->mak_id);
            $value->mak['saldo'] = $this->cekSaldoMak($value->mak_id, $tahun_id, $bidang_id);


            $value->tahun = Tahun::find($value->tahun_id);
            $value->jenis_kegiatan = JenisKegiatan::find($value->jenis_kegiatan_id);
            $value->user = User::find($value->user_id);
            $value->user['pegawai'] = Pegawai::find($value->user['pegawai_id']);
            $value->checker = Pegawai::find($value->checker_id);
            $value->ppk = Pegawai::find($value->ppk_id);
            $value->bendahara = Pegawai::find($value->bendahara_id);
            $value->bidang = Bidang::find($value->bidang_id);
            $value->lampiran = KegiatanLampiran::where('kegiatan_id' , $value->id)->get();

            foreach ($value->lampiran as $key => $lampiran) {
                $lampiran->pegawai = Pegawai::find(User::find($lampiran->user_id)->pegawai_id);
            }
            $value->log = KegiatanLog::where('kegiatan_id',$value->id)->orderBy('id','DESC')->get();
            foreach ($value->log as $key => $log) {
                $log->ago = $log->created_at->diffForHumans();
                $log->pegawai = Pegawai::find(User::find($log->user_id)->pegawai_id);
            }

        }

        return response()->json($master, 200);
    }

    public function storeRencana(Request $payload){

        $master = Kegiatan::create([
            'nomor_kwitansi' => $payload->tahun['nama'].'-'.$this->makeNomorKwitansi(),
            'uraian' => $payload->uraian,
            'output' => $payload->output,
            'total_anggaran' => $payload->total_anggaran,
            'lokasi' => $payload->lokasi,
            'jenis_kegiatan_id' => $payload->jenis_kegiatan['id'],
            'status' => 'RENCANA',
            'status_realisasi' => 'BELUM',
            'mak_id' => $payload->mak['id'],
            'tanggal_rencana_kegiatan' => $payload->tanggal_rencana_kegiatan,
            'tahun_id' => $payload->tahun['id'],
            'bidang_id' => $payload->user_data['bidang_id'],
            'user_id' => $payload->user_data['id'],
        ]);

        $message = 'ERROR';
        $response = '404';

        if($master){
            $message = $master;
            $this->storeLog($master->id,'RENCANA', 'RENCANA KEGIATAN TELAH DIBUAT, OLEH '.$payload->user_data['pegawai']['nama'], $payload->user_data, null);
            $response = 200;
        }

        return response()->json($message, $response);

    }

    public function destroy(Request $request){
        $id = $request->id;

        $master = Kegiatan::find($id);

        if($master){
            $master->delete();

            $log = KegiatanLog::where('kegiatan_id', $master->id)->get();
            foreach ($log as $key => $log) {
                $log->delete();
            }
            $kegiatan_lampiran = KegiatanLampiran::where('kegiatan_id', $master->id)->get();
            foreach ($kegiatan_lampiran as $key => $lampiran) {
                $lampiran->delete();
                if (Storage::disk('public')->exists($lampiran->file)) {
                    Storage::disk('public')->delete($lampiran->file);
                }
            }
        }
        return response()->json($master, 200);
    }
  

    public function uploadLampiranRencana(Request $payload){
        $output = [];
        $id = $payload->id;
        $user_id = $payload->user_id;
        
        foreach ($payload->file('lampiran') as $file) {
            $path = Storage::disk('public')->put('kegiatan',$file);
            $nama = $file->getClientOriginalName();
            $data = KegiatanLampiran::create([
                'kegiatan_id' => $id,
                'user_id' => $user_id,
                'nama' => $nama,
                'file' => $path,
            ]);
            $output[] = $data;
        }
       

        return response()->json($output, 200);
    }

    public function downloadLampiran(Request $payload){
        $id = $payload->id;
        
        $master = KegiatanLampiran::find($id);
        if (Storage::disk('public')->exists($master->file)) {
            return Storage::disk('public')->download($master->file);
        }

    }

    public function destroyLampiran(Request $payload){
        $id = $payload->id;

        $master = KegiatanLampiran::find($id);
        $master->delete();

        if (Storage::disk('public')->exists($master->file)) {
            Storage::disk('public')->delete($master->file);
        }
        return response()->json($master, 200);
    }

    public function status(Request $request){
        $response = 404;
        $id = $request->id;
        $messages = 'ERROR';
        $master = Kegiatan::find($id);

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
        $log = KegiatanLog::create([
            'kegiatan_id' => $id,
            'status' => $status_log,
            'catatan'=> $catatan,
            'bidang_id'=> $user_data['bidang_id'],
            'user_id'=> $user_data['id'],
            'keterangan' => $message_log,
        ]);
    }

    public function updateRealisasi(Request $payload){
        $id = $payload->id;

        $master = Kegiatan::find($id);

        $master->tanggal_realisasi_kegiatan = $payload->tanggal_realisasi_kegiatan;
        $master->total_realisasi = $payload->total_realisasi;
        $master->checker_id = $payload->checker['id'];
        $master->ppk_id = $payload->ppk['id'];
        $master->bendahara_id = $payload->bendahara['id'];
        $master->status_realisasi = 'SUDAH';

        $master->save();
    }

    public function makeNomorKwitansi(){

        $master = Kegiatan::all()->last();
        $output = 1;
        if($master){
            $dd = explode('-',$master->nomor_kwitansi);
            $output = $dd[1] + 1;
        }

        return $output;
    }

    public function cekSaldoMak($id, $tahun_id, $bidang_id){

        $mak = Mak::find($id);
        $output['realisasi'] = Kegiatan::where('mak_id',$id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->where('status', '!=', 'DITOLAK')->sum('total_realisasi');
        $output['unrealisasi'] = Kegiatan::where('mak_id',$id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->where('status', '!=', 'DITOLAK')->sum('total_anggaran');
        $output['saldo'] =  $mak->pagu -  $output['realisasi'] -  $output['unrealisasi'];
        return $output;
    }
}
