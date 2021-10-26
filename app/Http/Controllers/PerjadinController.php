<?php

namespace App\Http\Controllers;

use App\Models\Bidang;
use App\Models\Kegiatan;
use App\Models\Pegawai;
use App\Models\Peran;
use App\Models\Perjadin;
use App\Models\PerjadinLampiran;
use App\Models\PerjadinObrik;
use App\Models\PerjadinRAB;
use App\Models\PerjadinSusunanTim;
use App\Models\Satker;
use App\Models\SuratPerintah;
use App\Models\Tahun;
use App\Models\Urusan;
use App\Models\User;
use Illuminate\Http\Request;


class PerjadinController extends Controller
{

    public function index(Request $payload){
        $bidang_id = $payload->input('bidang_id');
        $tahun_id = $payload->input('tahun_id');

        $master =  Perjadin::where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->get();
        if($bidang_id == 0){
            $master =  Perjadin::where('tahun_id', $tahun_id)->get();
        }
        foreach ($master as $key => $value) {
            $value->surat_perintah = SuratPerintah::find($value->surat_perintah_id);
            $value->susunan_tim = PerjadinSusunanTim::where('perjadin_id',$value->id)->get();
            $value->mak = Kegiatan::find($value->mak_id);
            $value->tahun = Tahun::find($value->tahun_id);
            // DETAIL SUSUNAN TIM
            foreach ($value->susunan_tim as $key => $tim) {
                $tim->pegawai = Pegawai::find($tim->pegawai_id);
                $tim->anggaran = PerjadinRAB::find($tim->id);
                $tim->peran = Peran::find($tim->peran_id);
            }

            // DETAIL OBRIK
            $value->obrik = PerjadinObrik::where('perjadin_id',$value->id)->get();

            foreach ($value->obrik as $key => $obrik) {
                $obrik->satker = Satker::find($obrik->satker_id);
                $obrik->urusan = Urusan::find($obrik->urusan_id);
            }

            $value->lampiran = PerjadinLampiran::where('perjadin_id',$value->id)->get();
            $value->bidang = Bidang::find($value->bidang_id);
            $value->user = User::find($value->user_id);
        }

        return response()->json($master, 200);
    }
  
    public function store(Request $request){
        $surat_perintah = SuratPerintah::create([
            'nomor_surat' => $request->surat_perintah['nomor_surat'],
            'perihal' => $request->surat_perintah['perihal'],
            'tanggal_surat' => $request->surat_perintah['tanggal_surat'],
            'perjadin' => 'YA',
            'tahun_id' => $request->tahun['id'],
            'user_id' => $request->user_data['id'],
            'bidang_id' => $request->user_data['bidang_id'],
        ]);
        if($surat_perintah){
            $perjadin = Perjadin::create([
                'surat_perintah_id'=> $surat_perintah->id,
                'mak_id'=> $request->umum['mak']['id'],
                'jumlah_hari'=> $request->umum['jumlah_hari'],
                'tujuan'=> $request->umum['tujuan'],
                'keberangkatan'=> $request->umum['keberangkatan'],
                'tanggal_berangkat'=> $request->umum['tanggal_berangkat'],
                'tanggal_kembali'=> $request->umum['tanggal_kembali'],
                'user_id' => $request->user_data['id'],
                'bidang_id' => $request->user_data['bidang_id'],
            ]);

            $perjadin->surat_perintah = $surat_perintah;
        }

        if($perjadin){
            $obrik = [];
            $tim = [];
            
            foreach ($request->obrik['detail'] as $key => $satker) {
                $object = PerjadinObrik::create([
                    'perjadin_id' => $perjadin->id,
                    'satker_id'=> $satker['satker']['id'],
                    'urusan_id'=> $satker['urusan']['id'],
                ]);
                $obrik[] = $object;
                $perjadin->obrik = $obrik;
            }

            foreach ($request->susunan_tim as $key => $tim) {
                $anggota = PerjadinSusunanTim::create([
                    'perjadin_id'=> $perjadin->id,
                    'pegawai_id'=> $tim['id'],
                    'peran_id'=> $tim['peran']['id'],
                ]);

                if($anggota){
                    $anggaran = PerjadinRAB::create([
                        'perjadin_id' => $perjadin->id,
                        'susunan_tim_perjadin_id' => $anggota->id,
                        'jumlah_hari'=> $request->rencana_anggaran[$key]['jumlah_hari'],
                        'jumlah_malam'=> $request->rencana_anggaran[$key]['jumlah_malam'],
                        'darat'=> $request->rencana_anggaran[$key]['darat'],
                        'laut'=> $request->rencana_anggaran[$key]['laut'],
                        'representatif'=> $request->rencana_anggaran[$key]['representatif'],
                        'taksi_jakarta'=> $request->rencana_anggaran[$key]['taksi_jakarta'],
                        'taksi_provinsi'=> $request->rencana_anggaran[$key]['taksi_provinsi'],
                        'uang_harian'=> $request->rencana_anggaran[$key]['uang_harian'],
                        'uang_hotel'=> $request->rencana_anggaran[$key]['uang_hotel'],
                        'udara'=> $request->rencana_anggaran[$key]['udara'],
                        'total'=> $request->rencana_anggaran[$key]['total'],
                    ]);

                    $anggota->anggaran = $anggaran;
                }

                $tim[] = $anggota;

                $perjadin->susunan_tim= $tim;
            }


        }
     
    }
}
