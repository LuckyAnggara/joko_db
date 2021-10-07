<?php

namespace App\Http\Controllers;

use App\Models\Kegiatan;
use App\Models\Realisasi;
use Illuminate\Http\Request;


class RealisasiController extends Controller
{
  
    public function index(Request $payload){
        $bidang_id = $payload->input('bidang_id');
        $tahun_id = $payload->input('tahun_id');

        $master =  Realisasi::where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->get();

        foreach ($master as $key => $value) {
            $value->kegiatan = Kegiatan::find($value->kegiatan_id);
            $value->maker = Kegiatan::find($value->maker_id);
            $value->checker = Kegiatan::find($value->checker_id);
        }

        return response()->json($master, 200);
    }
}
