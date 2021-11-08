<?php

namespace App\Http\Controllers;

use App\Models\Jabatan;

use Illuminate\Http\Request;


class JabatanController extends Controller
{
  
    public function index(Request $payload){
        $master =  Jabatan::all();
        return response()->json($master, 200);
    }
}
