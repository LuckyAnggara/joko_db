<?php

namespace App\Http\Controllers;

use App\Models\Kegiatan;
use App\Models\Realisasi;
use App\Models\RealisasiLampiran;
use Illuminate\Http\Request;


class RealisasiController extends Controller
{
  
    public function index(Request $payload){
        $bidang_id = $payload->input('bidang_id');
        $tahun_id = $payload->input('tahun_id');

        $master =  Realisasi::where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->get();

        foreach ($master as $key => $value) {
            $value->kegiatan = Kegiatan::find($value->kegiatan_id);
            $value->maker = Kegiatan::find($value->maker_id);
            $value->checker = Kegiatan::find($value->checker_id);
        }

        return response()->json($master, 200);
    }

    public function store(Request $payload){

        $master = Realisasi::create([
            'nomor_kwitansi' => $payload->tahun['nama'].'-'.$this->makeNomorKwitansi(),
            'uraian' => $payload->uraian,
            'nominal' => $payload->nominal,
            'status' => 'MENUNGGU',
            'kegiatan_id' => $payload->kegiatan['id'],
            'tanggal_spb' => $payload->tanggal_spb,
            'maker_id' => $payload->maker['id'],
            'checker_id' => $payload->checker['id'],
            'tahun_id' => $payload->tahun['id'],
            'bidang_id' => $payload->userData['id'],
        ]);

        // $lampiran = RealisasiLampiran::create([

        // ]);

        return response()->json($master, 200);
    }

    public function storeLampiran(Request $payload){
        $output = [];
        $id = $payload->id;
        
        foreach ($payload->file('lampiran') as $file) {
            $nama = $file->getClientOriginalName();
            $filePath = $file->storeAs('uploads', $nama, 'public');
            $data = RealisasiLampiran::create([
                'realisasi_id' => $id,
                'nama' => $nama,
                'file' => $filePath,
            ]);
            $output[] = $data;
        }
       

        return response()->json($output, 200);
    }
    
    public function makeNomorKwitansi(){

        $master = Realisasi::all()->last();
        $dd = explode('-',$master->nomor_kwitansi);
        $output = $dd[1] + 1;
        return $output;
    }
}
