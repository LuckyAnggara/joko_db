<?php

namespace App\Http\Controllers;

use App\Models\Bidang;
use App\Models\Mak;
use App\Models\Pegawai;
use App\Models\KegiatanRealisasi;
use App\Models\KegiatanRealisasiLampiran;
use App\Models\Tahun;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\URL;

class RealisasiController extends Controller
{
  
    public function index(Request $payload){
        $bidang_id = $payload->input('bidang_id');
        $tahun_id = $payload->input('tahun_id');

        $master =  KegiatanRealisasi::where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->get();
        if($bidang_id == 0){
            $master =  KegiatanRealisasi::where('tahun_id', $tahun_id)->get();
        }

        foreach ($master as $key => $value) {
            $value->mak = Mak::find($value->mak_id);
            $value->maker = Mak::find($value->maker_id);
            $value->checker = Mak::find($value->checker_id);
        }

        return response()->json($master, 200);
    }

    public function store(Request $payload){

        $master = KegiatanRealisasi::create([
            'nomor_kwitansi' => $payload->tahun['nama'].'-'.$this->makeNomorKwitansi(),
            'uraian' => $payload->uraian,
            'nominal' => $payload->nominal,
            'status' => 'VERIFIKASI',
            'mak_id' => $payload->mak['id'],
            'tanggal_spb' => $payload->tanggal_spb,
            'maker_id' => $payload->maker['id'],
            'checker_id' => $payload->checker['id'],
            'tahun_id' => $payload->tahun['id'],
            'bidang_id' => $payload->userData['bidang_id'],
            'user_id' => $payload->userData['id'],
        ]);

        // $lampiran = KegiatanRealisasiLampiran::create([

        // ]);

        return response()->json($master, 200);
    }

    public function uploadLampiran(Request $payload){
        $output = [];
        $id = $payload->id;
        
        foreach ($payload->file('lampiran') as $file) {
            $path = Storage::disk('public')->put('realisasi',$file);
            $nama = $file->getClientOriginalName();
            $data = KegiatanRealisasiLampiran::create([
                'realisasi_id' => $id,
                'nama' => $nama,
                'file' => $path,
            ]);
            $output[] = $data;
        }
       

        return response()->json($output, 200);
    }

    public function downloadLampiran(Request $payload){
        $id = $payload->id;
        
        $master = KegiatanRealisasiLampiran::find($id);
        if (Storage::disk('public')->exists($master->file)) {
            return Storage::disk('public')->download($master->file);
        }

    }
    
    public function destroy(Request $payload){
        $output = [];
        $id = $payload->input('id');

        $master = KegiatanRealisasi::find($id);
        $response = 404;
        if($master){
            $master->delete();
            $detail = KegiatanRealisasiLampiran::where('realisasi_id', $master->id)->get();
            foreach ($detail as $key => $value) {
                $value->delete();
                $file_path = public_path() .$value->file;
                
                if(file_exists($file_path)){ 
                    unlink($file_path);
                }
                $output[] = $file_path;

            }
        $response = 200;
        }

        return response()->json($output, $response);
    }

    public function show(Request $payload){
        $id = $payload->input('id');

        $master = KegiatanRealisasi::find($id);
        $response = 404;
        $data = null;
        if($master){
            $response = 200;
            $data = $master;
            $master->tahun = Tahun::find($master->tahun_id);
            $master->bidang = Bidang::find($master->bidang_id);
            $master->mak = Mak::find($master->mak_id);
            $master->maker = Pegawai::find($master->maker_id);
            $master->checker = Pegawai::find($master->checker_id);
            $master->lampiran = KegiatanRealisasiLampiran::where('realisasi_id', $master->id)->get();
        }
        
        return response()->json($data, $response);  
    }

    public function updateStatus(Request $payload){
        $id = $payload->id;
        $status = $payload->status;
        $response = 404;

        $master = KegiatanRealisasi::find($id);
        if($master){
            $master->status = $status;
            if($status === 'PEMBAYARAN'){
                $master->verified_at = date('Y-m-d h:i:s');
            }if($status === 'SELESAI'){
                $master->paid_at = date('Y-m-d h:i:s');
            }
            $master->save();

            $response = 200;
        }
        return response()->json($master, $response);  
    }

    public function makeNomorKwitansi(){

        $master = KegiatanRealisasi::all()->last();
        $output = 1;
        if($master){
            $dd = explode('-',$master->nomor_kwitansi);
            $output = $dd[1] + 1;
        }

        return $output;
    }


    // LAPORAN

    public function laporanRincian(Request $payload){
        $tahun_id = $payload->input('tahun_id');
        $bidang_id = $payload->input('bidang_id');

        $mak = Mak::where('tahun_id', $tahun_id)
        ->where('bidang_id', $bidang_id)->get();

        foreach ($mak as $key => $value) {
           $value->realisasi = KegiatanRealisasi::where('mak_id', $value->id)->get();
           $value->total_realisasi = 0;
           $value->total_unrealisasi = 0;

           foreach ($value->realisasi as $key => $realisasi) {
                if($realisasi->status === 'SELESAI'){
                    $value->total_realisasi += $realisasi->nominal;
                }else if ($realisasi->status === 'VERIFIKASI' || $realisasi->status === 'PEMBAYARAN'){
                    $value->total_unrealisasi += $realisasi->nominal;
                }
            }
        }
        return response()->json($mak, 200);  
    }
}
