<?php

namespace App\Http\Controllers;

use App\Models\Bidang;

use Illuminate\Http\Request;


class BidangController extends Controller
{
  
    public function index(Request $payload){
        $master =  Bidang::all();
        return response()->json($master, 200);
    }
}
