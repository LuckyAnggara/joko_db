<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\BMNKendaraanDinas;
use App\Models\Pegawai;

class BMNKendaraanDinasController extends Controller
{
    public function index(Request $payload){
        $master =  BMNKendaraanDinas::all();

        foreach ($master as $key => $value) {
            $value->pemilik = Pegawai::find($value->user_id)->first()->nama;
        }
        return response()->json($master, 200);
    }

    public function getDetail(Request $payload){
        $nopol =  $payload->nopol;

        $master = BMNKendaraanDinas::where('nopol',$nopol)->get()->first();
        if($master){
            return response()->json($master, 200);
        }
        return response()->json('no', 200);
    }
}
