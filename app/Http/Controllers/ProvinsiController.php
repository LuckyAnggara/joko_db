<?php

namespace App\Http\Controllers;

use App\Models\Provinsi;
use Illuminate\Http\Request;


class ProvinsiController extends Controller
{
  
    public function index(){
        $master =  Provinsi::all();
        return response()->json($master, 200);
    }
}
