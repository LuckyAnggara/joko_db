<?php

namespace App\Http\Controllers;

use App\Models\Bidang;
use App\Models\Golongan;
use App\Models\Jabatan;
use App\Models\Kegiatan;
use App\Models\Pegawai;
use App\Models\Realisasi;
use App\Models\BidangIlmu;
use App\Models\PetaKompetensi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class PegawaiController extends Controller
{
  
    public function index(){
        $master =  Pegawai::all();

        foreach ($master as $key => $value) {
            $value->golongan = Golongan::find($value->golongan_id);
            $value->jabatan = Jabatan::find($value->jabatan_id);
            $value->bidang = Bidang::find($value->bidang_id);
            $value->peta_kompetensi = PetaKompetensi::where('pegawai_id',$value->id)->get();

            foreach ($value->peta_kompetensi as $key => $x) {
                $x->bidang_ilmu = BidangIlmu::find($x->bidang_ilmu_id);
            }
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

    public function storeKompetensi(Request $payload){

        $master = PetaKompetensi::create([
            'pegawai_id' => $payload->pegawai_id,
            'bidang_ilmu_id' => $payload->bidang_ilmu,
            'nama_pelatihan' => $payload->nama_pelatihan,
            'tahun_pelaksanaan' => $payload->tahun_pelaksanaan,
            'level' => $payload->level,
            'skala' => $payload->skala,
            'nama_file' => null,
            'file' => null,
            'penyelenggara' => $payload->penyelenggara,
            'tanggal_mulai' => $payload->tanggal_mulai,
            'tanggal_akhir' => $payload->tanggal_akhir,
            'user_id' => $payload->user_data['id'],
        ]);
        $master->bidang_ilmu = BidangIlmu::find($payload->bidang_ilmu);
        return response()->json($master, 200);
    }

    public function storeLampiranKompetensi(Request $payload){
        $id = $payload->id;
        
        if($payload->file('lampiran')){
                foreach ($payload->file('lampiran') as $file) {
                $path = Storage::disk('public')->put('sertifikat/',$file);
                $nama = $file->getClientOriginalName();

                $data = PetaKompetensi::find($id);
                $data->nama_file = $nama;
                $data->file = $path;
                $data->save();

                }
        }
        return response()->json($data, 200);
    }

    public function destroyKompetensi(Request $payload){
        $id = $payload->id;

        $master = PetaKompetensi::find($id);
        if($master){
            $master->delete();

            if (Storage::disk('public')->exists($master->file)) {
                Storage::disk('public')->delete($master->file);
           }
    
        }
        return response()->json($master, 200);


    }
}
