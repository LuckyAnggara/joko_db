<?php

namespace App\Http\Controllers;

use App\Models\Kegiatan;
use App\Models\Realisasi;
use App\Models\Tahun;
use Illuminate\Http\Request;


class TahunController extends Controller
{
  
    public function index(){
        $master =  Tahun::all();
        return response()->json($master, 200);
    }
}
