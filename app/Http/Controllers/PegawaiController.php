<?php

namespace App\Http\Controllers;

use App\Models\Kegiatan;
use App\Models\Pegawai;
use App\Models\Realisasi;
use Illuminate\Http\Request;


class PegawaiController extends Controller
{
  
    public function index(){


        $master =  Pegawai::all();

        return response()->json($master, 200);
    }
}
