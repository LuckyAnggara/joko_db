<?php

namespace App\Http\Controllers;

use App\Models\Urusan;
use App\Models\Satker;
use Illuminate\Http\Request;


class UrusanController extends Controller
{
  
    public function index(){
        $master =  Urusan::all();
        return response()->json($master, 200);
    }
}
