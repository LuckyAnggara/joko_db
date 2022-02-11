<?php

namespace App\Http\Controllers;

use App\Models\Kegiatan;
use App\Models\Mak;
use App\Models\Perjadin;
use Illuminate\Http\Request;


class LaporanController extends Controller
{
   
    public function rencanaKegiatan(Request $payload){

        $tahun_id = $payload->input('tahun_id');
        $bidang_id = $payload->input('bidang_id');

        $unrealisasi_kegiatan =  Kegiatan::where('bidang_id',$bidang_id)->where('tahun_id', $tahun_id)->where('status','!=','SELESAI')->get();
        foreach ($unrealisasi_kegiatan as $key => $value) {
            $value->mak = Mak::find($value->mak_id);
        }
        $unrealisasi_perjadin = Perjadin::where('bidang_id',$bidang_id)->where('tahun_id', $tahun_id)->where('status','!=','SELESAI')->get();
        foreach ($unrealisasi_perjadin as $key => $value) {
            $value->mak = Mak::find($value->mak_id);
        }

        $master = [...$unrealisasi_kegiatan,...$unrealisasi_perjadin];
    
        return response()->json($master, 200);
    }

    public function realisasiKegiatan(Request $payload){

        $tahun_id = $payload->input('tahun_id');
        $bidang_id = $payload->input('bidang_id');

        $unrealisasi_kegiatan =  Kegiatan::where('bidang_id',$bidang_id)->where('tahun_id', $tahun_id)->where('status','=','SELESAI')->get();
        foreach ($unrealisasi_kegiatan as $key => $value) {
            $value->mak = Mak::find($value->mak_id);
        }
        $unrealisasi_perjadin = Perjadin::where('bidang_id',$bidang_id)->where('tahun_id', $tahun_id)->where('status','=','SELESAI')->get();
        foreach ($unrealisasi_perjadin as $key => $value) {
            $value->mak = Mak::find($value->mak_id);
        }

        $master = [...$unrealisasi_kegiatan,...$unrealisasi_perjadin];
    
        return response()->json($master, 200);
    }


}
