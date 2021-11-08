<?php

namespace App\Http\Controllers;

use App\Models\Bidang;
use App\Models\Golongan;
use App\Models\Jabatan;
use App\Models\Kegiatan;
use App\Models\Pegawai;
use App\Models\Realisasi;
use Illuminate\Http\Request;


class PegawaiController extends Controller
{
  
    public function index(){


        $master =  Pegawai::all();

        foreach ($master as $key => $value) {
            $value->golongan = Golongan::find($value->golongan_id);
            $value->jabatan = Jabatan::find($value->jabatan_id);
            $value->bidang = Bidang::find($value->bidang_id);
        }

        return response()->json($master, 200);
    }
}
