<?php

namespace App\Http\Controllers;

use App\Models\Kegiatan;
use App\Models\Realisasi;
use Illuminate\Http\Request;


class KegiatanController extends Controller
{
  
    public function index(Request $payload){
        $bidang_id = $payload->input('bidang_id');
        $tahun_id = $payload->input('tahun_id');

        $master =  Kegiatan::where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->get();

        foreach ($master as $key => $value) {
            $value->realisasi = Realisasi::where('kegiatan_id',$value->id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->where('status','DISETUJUI')->sum('nominal');
            $value->unrealisasi = Realisasi::where('kegiatan_id',$value->id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->where('status','MENUNGGU')->sum('nominal');
        }

        return response()->json($master, 200);
    }
}
