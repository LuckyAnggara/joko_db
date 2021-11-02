<?php

namespace App\Http\Controllers;

use App\Models\JenisKegiatan;
use Illuminate\Http\Request;

class JenisKegiatanController extends Controller
{
    public function index(){
        $master =  JenisKegiatan::all();
        return response()->json($master, 200);
    }
}
