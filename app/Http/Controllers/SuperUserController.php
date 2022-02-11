<?php

namespace App\Http\Controllers;

use App\Models\Bidang;
use App\Models\User;
use App\Models\Pegawai;
use Illuminate\Http\Request;


class SuperUserController extends Controller
{
   public function index(){
      $master = User::all();

      foreach ($master as $key => $value) {
         $value->pegawai = Pegawai::find($value->pegawai_id);
         $value->bidang = Bidang::find($value->bidang_id);
      }

      return response()->json($master, 200);
   }

   public function store(Request $payload){

      $master = User::create([
         'username' => $payload->username,
         'password' => '123456',
         'bidang_id'=> $payload->pegawai['bidang']['id'],
         'pegawai_id' =>  $payload->pegawai['id'],
         'nama' =>  $payload->pegawai['nama'],
         'role' =>  $payload->role['nama'],
         'ability' =>  $payload->role['ability'],
      ]);

      return response()->json($master, 200);

   }

}
