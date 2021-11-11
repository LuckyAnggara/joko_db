<?php

namespace App\Http\Controllers;

use App\Models\Bidang;
use App\Models\BidangIlmu;
use Illuminate\Http\Request;


class BidangIlmuController extends Controller
{
  
    public function index(Request $payload){
        $master =  BidangIlmu::all();
        return response()->json($master, 200);
    }
}
