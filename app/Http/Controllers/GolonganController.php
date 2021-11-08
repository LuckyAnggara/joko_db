<?php

namespace App\Http\Controllers;

use App\Models\Golongan;

use Illuminate\Http\Request;


class GolonganController extends Controller
{
  
    public function index(Request $payload){
        $master =  Golongan::all();
        return response()->json($master, 200);
    }
}
