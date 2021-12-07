<?php

namespace App\Http\Controllers;

use App\Models\Bidang;
use App\Models\Mak;
use App\Models\Pegawai;
use App\Models\RevisiAnggaran;
use App\Models\RevisiAnggaranDetail;
use App\Models\RevisiAnggaranDetailMak;
use App\Models\Tahun;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\URL;

class RevisiAnggaranController extends Controller
{
    public function index(Request $payload){

        $tahun_id = $payload->tahun_id;
        $master = RevisiAnggaran::where('tahun_id', $tahun_id)->get();
        foreach ($master as $key => $value) {
            $value->tahun = Tahun::find($value->tahun_id);
            $value->user = User::find($value->user_id);
            $value->detail = RevisiAnggaranDetail::where('revisi_anggaran_id',$value->id)->get();
            foreach ($value->detail as $key => $x) {
                $x->bidang = Bidang::find($x->bidang_id);
                if($x->status === 'VERIFIKASI');
                $x->detail = RevisiAnggaranDetailMak::where('revisi_anggaran_detail_id',$x->id)->get();
                foreach ($x->detail as $key => $y) {
                    $y->mak = Mak::find($y->mak_id);
                }
            }
        }
        return response()->json($master, 200);
    }

    public function store(Request $payload){

        $master = RevisiAnggaran::create([
            'tahun_id' => $payload->tahun['id'],
            'keterangan' => $payload->keterangan,
            'status' => 'BUKA',
            'tanggal_mulai' => $payload->tanggal_mulai,
            'tanggal_akhir' => $payload->tanggal_akhir,
            'user_id' => $payload->user_data['id'],
        ]);

        if($master){
            $bidang = Bidang::all();
            foreach ($bidang as $key => $value) {
                $pagu = Mak::where('bidang_id', $value->id)->where('tahun_id', $payload->tahun['id'])->sum('pagu');
                $detail[] = RevisiAnggaranDetail::create([
                    'revisi_anggaran_id' => $master->id,
                    'bidang_id' => $value->id,
                    'pagu_awal' => $pagu,
                    'pagu_akhir' => $pagu,
                    'status' => 'PROSES',
                ]);
            }
            $output['master'] = $master;
            $output['detail'] = $detail;
    
            return response()->json($output, 200);
        }

        return response()->json('ERROR', 404);
    }

    public function uploadLampiranMaster(Request $payload){
        $id = $payload->id;

        foreach ($payload->file('lampiran') as $file) {
            $path = Storage::disk('public')->put('revisi_anggaran/master',$file);
            $nama = 'REVISI_ANGGARAN_'.$file->getClientOriginalName();

            $master = RevisiAnggaran::find($id);
            $master->file = $path;
            $master->nama_file = $nama;
            $master->save();
        }

        return response()->json($master, 200);
    }

    public function downloadLampiran(Request $payload){
        $id = $payload->id;
        
        $master = RevisiAnggaran::find($id);
        if (Storage::disk('public')->exists($master->file)) {
            return Storage::disk('public')->download($master->file);
        }

    }

    public function destroyRevisiAnggaran(Request $request){
        $id = $request->id;

        $master = RevisiAnggaran::find($id);
        if($master){
            $master->delete();
            if (Storage::disk('public')->exists($master->file)) {
                Storage::disk('public')->delete($master->file);
            }
        }
        return response()->json($master, 200);
    }

    public function storeRevisi(Request $request){

        $master = RevisiAnggaranDetail::find($request->id);
        if($master){
            foreach ($request->detail as $key => $value) {
                $detail[] = RevisiAnggaranDetailMak::create([
                    'revisi_anggaran_detail_id' => $request->id,
                    'mak_id'=> $value['id'],
                    'pagu_awal'=> $value['pagu_awal'],
                    'pagu_akhir'=> $value['pagu'],
                ]);
            }
    
            $master->status = 'VERIFIKASI';
            $master->pagu_akhir = $request->pagu_akhir;
            $master->pagu_realokasi =  $request->pagu_realokasi;
            $master->save();
    
            return response()->json($master, 200);
        }
        return response()->json('Data Master tidak di temukan', 404);
    }
    public function editRevisi(Request $request){
        $id = $request->id;
        $master = RevisiAnggaran::find($id);
        $master->keterangan = $request->keterangan;
        $master->tanggal_mulai = $request->tanggal_mulai;
        $master->tanggal_akhir = $request->tanggal_akhir;
        $master->status = $request->status;
        $master->save();
        return response()->json($master, 200);
    }

    
    public function editLampiranRevisiAnggaran(Request $payload){
        $id = $payload->id;
        $master = RevisiAnggaran::find($id);
        if($master){
            if (Storage::disk('public')->exists($master->file)) {
                Storage::disk('public')->delete($master->file);
            }
            foreach ($payload->file('lampiran') as $file) {
                $path = Storage::disk('public')->put('revisi_anggaran/master',$file);
                $nama = 'REVISI_ANGGARAN_'.$file->getClientOriginalName();
    
                $master->file = $path;
                $master->nama_file = $nama;
                $master->save();
            }
        }
   

        return response()->json($master, 200);
    }

    public function prosesRevisiAnggaran(Request $request){
        $id = $request->id;
        $master = RevisiAnggaran::find($id);

        if($master){
            $detail = RevisiAnggaranDetail::where('revisi_anggaran_id', $master->id)->get();
            foreach ($detail as $key => $value) {
                $dd =  RevisiAnggaranDetailMak::where('revisi_anggaran_detail_id', $value->id)->get();
                foreach ($dd as $key => $x) {
                   $mak = Mak::find($x->mak_id);
                   $mak->pagu = $x->pagu_akhir;
                   $mak->save();
                }
            }
            $master->status = 'SELESAI';
            $master->save();
            return response()->json($master, 200);
        }
    }


    public function statusRevisiDetail(Request $request){
        $id = $request->id;
        $master = RevisiAnggaranDetail::find($id);
        $master->status = $request->status;
        $master->save();
        return response()->json($master, 200);
    }   
    public function statusRevisi(Request $request){
        $id = $request->id;
        $master = RevisiAnggaran::find($id);
        $master->status = $request->status;
        $master->save();
        return response()->json($master, 200);
    } 
}

