<?php

namespace App\Http\Controllers;

use App\Models\Bidang;
use App\Models\Kegiatan;
use App\Models\Mak;
use App\Models\KegiatanRealisasi;
use App\Models\KegiatanRealisasiLampiran;
use App\Models\Perjadin;
use Illuminate\Http\Request;


class MakController extends Controller
{
    public function index(Request $payload){
        $bidang_id = $payload->input('bidang_id');
        $tahun_id = $payload->input('tahun_id');

        if($bidang_id != 0){
            $master =  Mak::where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->get();
            foreach ($master as $key => $value) {
                $realisasi_kegiatan =  Kegiatan::where('mak_id',$value->id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->where('status','SELESAI')->sum('total_realisasi');
                $realisasi_perjadin = Perjadin::where('mak_id',$value->id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->where('status','SELESAI')->sum('total_realisasi');
                
                $unrealisasi_kegiatan =  Kegiatan::where('mak_id',$value->id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->where('status','!=','SELESAI')->sum('total_anggaran');
                $unrealisasi_perjadin = Perjadin::where('mak_id',$value->id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->where('status','!=','SELESAI')->sum('total_anggaran');
        
                $value->realisasi = $realisasi_kegiatan + $realisasi_perjadin;
                $value->unrealisasi = $unrealisasi_kegiatan + $unrealisasi_perjadin;
    
                $kegiatan = Kegiatan::where('mak_id', $value->id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->get();
    
                $perjadin =  Perjadin::where('mak_id', $value->id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->get();
    
                $value->rincian = [...$kegiatan,...$perjadin];
    
                $value->bidang = Bidang::find($value->bidang_id);
            }
        }else if($bidang_id == 0){
            $master =  Mak::where('tahun_id', $tahun_id)->get();
            foreach ($master as $key => $value) {
                $realisasi_kegiatan =  Kegiatan::where('mak_id',$value->id)->where('tahun_id', $tahun_id)->where('status','SELESAI')->sum('total_realisasi');
                $realisasi_perjadin = Perjadin::where('mak_id',$value->id)->where('tahun_id', $tahun_id)->where('status','SELESAI')->sum('total_realisasi');
                
                $unrealisasi_kegiatan =  Kegiatan::where('mak_id',$value->id)->where('tahun_id', $tahun_id)->where('status','!=','SELESAI')->sum('total_anggaran');
                $unrealisasi_perjadin = Perjadin::where('mak_id',$value->id)->where('tahun_id', $tahun_id)->where('status','!=','SELESAI')->sum('total_anggaran');
        
                $value->realisasi = $realisasi_kegiatan + $realisasi_perjadin;
                $value->unrealisasi = $unrealisasi_kegiatan + $unrealisasi_perjadin;
    
                $kegiatan = Kegiatan::where('mak_id', $value->id)->where('tahun_id', $tahun_id)->get();
    
                $perjadin =  Perjadin::where('mak_id', $value->id)->where('tahun_id', $tahun_id)->get();
    
                $value->rincian = [...$kegiatan,...$perjadin];
    
                $value->bidang = Bidang::find($value->bidang_id);
            }
        }
       

        return response()->json($master, 200);
    }

    public function store(Request $payload){
        $response = 404;
        $message = 'ERROR';
        $master = Mak::create([
            'kode' => $payload->kode,
            'nama' => $payload->nama,
            'pagu' => $payload->pagu,
            'bidang_id' => $payload->bidang_id,
            'tahun_id' => $payload->tahun_id,
            'user_id' => $payload->user['id'],
        ]);

        if($master){
        $response = 200;
        $message = $master;
        }

        return response()->json($message, $response);

    }

    public function destroy(Request $payload){
        $id = $payload->input('id');

        $master = Mak::find($id);
        $response = 404;
        if($master){
            $master->delete();
            $realisasi = KegiatanRealisasi::where('mak_id', $master->id)->get();
            foreach ($realisasi as $key => $value) {
                $value->delete();
                $lampiran = KegiatanRealisasiLampiran::where('realisasi_id', $value->id)->get();
                foreach ($lampiran as $key => $val) {
                    $val->delete();
                    $file_path = public_path() .$val->file;
                    if(file_exists($file_path)){ 
                        unlink($file_path);
                    }
                }
            }
            $response = 200;
        }
        return response()->json($master, $response);
    }

    public function storeRevisi(Request $payload){
        $output = [];
        foreach ($payload->data as $key => $value) {
            $master = Mak::find($value['id']);

            $master->pagu = $value['pagu'];
            $master->save();

            $output[] = $master;
        }

        return response()->json($output, 200);
    }

    public function cekMak(Request $payload){
        $message = 0;
        $kode = $payload->kode;

        $count = Mak::where('kode', $kode)->get()->count();

        if($count > 0){
            $message = $count;
        }
        return response()->json($message, 200);
    }

    public function saldo($id, $tahun_id, $bidang_id){

        $output['realisasi'] = KegiatanRealisasi::where('mak_id',$id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->where('status','SELESAI')->sum('nominal');
        $output['unrealisasi'] = KegiatanRealisasi::where('mak_id',$id)->where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->whereIn ('status', ['VERIFIKASI','PEMBAYARAN'])->sum('nominal');
        
        return response()->json($output, 200);
    }

}
