<?php

namespace App\Http\Controllers;

use App\Models\Bidang;
use App\Models\Golongan;
use App\Models\Jabatan;
use App\Models\Kegiatan;
use App\Models\Pegawai;
use App\Models\Realisasi;
use Illuminate\Http\Request;


class PegawaiController extends Controller
{
  
    public function index(){


        $master =  Pegawai::all();

        foreach ($master as $key => $value) {
            $value->golongan = Golongan::find($value->golongan_id);
            $value->jabatan = Jabatan::find($value->jabatan_id);
            $value->bidang = Bidang::find($value->bidang_id);
        }

        return response()->json($master, 200);
    }

    public function store(Request $payload){
        
        $master = Pegawai::create([
            'nama' => $payload->nama,
            'nip' => $payload->nama,
            'tanggal_lahir' => $payload->tanggal_lahir,
            'golongan_id' => $payload->golongan,
            'jabatan_id' => $payload->jabatan,
            'bidang_id' => $payload->bidang,
            'user_id' => $payload->user_data['id'],
            'foto' => 'foto_pegawai/avatar.jpg',
        ]);
        return response()->json($master, 200);
    }

    public function storeLampiran(Request $payload){
        $id = $payload->id;
        
        if($payload->file('lampiran')){
                foreach ($payload->file('lampiran') as $file) {
                $path = Storage::disk('public')->put('foto_pegawai/',$file);
                $nama = $file->getClientOriginalName();

                $data = Pegawai::find($id);
                $data->foto = $path;
                $data->save();

                }
        }
        return response()->json($data, 200);


    }
}
