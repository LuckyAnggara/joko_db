<?php

namespace App\Http\Controllers;

use App\Models\Peran;
use Illuminate\Http\Request;


class PeranController extends Controller
{
  
    public function index(){
        $master =  Peran::all();
        return response()->json($master, 200);
    }
}
