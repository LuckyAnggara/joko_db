<?php

namespace App\Http\Controllers;

use App\Models\Bidang;
use App\Models\Kegiatan;
use App\Models\Realisasi;
use App\Models\RealisasiLampiran;
use Illuminate\Http\Request;


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
            $value->realisasi = Realisasi::where('kegiatan_id',$value->id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->where('status','SELESAI')->sum('nominal');
            $value->unrealisasi = Realisasi::where('kegiatan_id',$value->id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->where('status', ['VERIFIKASI','PEMBAYARAN'])->sum('nominal');
            $value->bidang = Bidang::find($value->bidang_id);
        }

        return response()->json($master, 200);
    }

    public function store(Request $payload){
        $response = 404;
        $message = 'ERROR';
        $master = Kegiatan::create([
            'kode' => $payload->kode,
            'nama' => $payload->nama,
            'dipa' => $payload->dipa,
            'bidang_id' => $payload->bidang_id,
            'tahun_id' => $payload->tahun_id,
            'user_id' => $payload->user['id'],
        ]);

        if($master){
        $response = 200;
        $message = $master;
        }

        return response()->json($message, $response);

    }

    public function destroy(Request $payload){
        $id = $payload->input('id');

        $master = Kegiatan::find($id);
        $response = 404;
        if($master){
            $master->delete();
            $realisasi = Realisasi::where('kegiatan_id', $master->id)->get();
            foreach ($realisasi as $key => $value) {
                $value->delete();
                $lampiran = RealisasiLampiran::where('realisasi_id', $value->id)->get();
                foreach ($lampiran as $key => $val) {
                    $val->delete();
                    $file_path = public_path() .$val->file;
                    if(file_exists($file_path)){ 
                        unlink($file_path);
                    }
                }
            }
            $response = 200;
        }
        return response()->json($master, $response);
    }

    public function cekMak(Request $payload){
        $message = 0;
        $kode = $payload->kode;

        $count = Kegiatan::where('kode', $kode)->get()->count();

        if($count > 0){
            $message = $count;
        }
        return response()->json($message, 200);
    }

}
