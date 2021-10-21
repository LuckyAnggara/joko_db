<?php

namespace App\Http\Controllers;

use App\Models\Kanwil;
use App\Models\Satker;
use Illuminate\Http\Request;


class KanwilController extends Controller
{
  
    public function index(){
        $master =  Kanwil::all();

        foreach ($master as $key => $value) {
            $value->satker = Satker::where('kanwil_id', $value->id)->get();
        }
        
        return response()->json($master, 200);
    }
}
