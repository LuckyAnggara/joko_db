<?php

namespace App\Http\Controllers;

use App\Models\Bidang;
use App\Models\Kegiatan;
use App\Models\Realisasi;
use Illuminate\Http\Request;


class BidangController extends Controller
{
  
    public function index(Request $payload){
        $master =  Bidang::all();
        return response()->json($master, 200);
    }
}
