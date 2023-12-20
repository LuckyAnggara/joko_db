<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Models\User;
use App\Models\Bidang;
use App\Models\Pegawai;

class AuthController extends Controller
{
    public function login(Request $request){

            $user = User::where('username', '=', $request->username)->first();
            if(!$user){
                $code = 201;
                $response = 'User Tidak Ditemukan';
                return response()->json($response, $code);
            }
            if($user->password == $request->password){
                $code = 200;

                $user->pegawai = Pegawai::find($user->pegawai_id);
                $user->bidang = Bidang::find($user->bidang_id);
                $response = $user;
          
            }else{
                $code = 202; // PASSWORD SALAH
                $response = 'Password Tidak Sesuai';
            }
           
        return response()->json($response, $code);
    }

    // public function logout(){
    // }
}
