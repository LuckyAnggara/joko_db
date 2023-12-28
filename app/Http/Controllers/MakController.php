<?php

namespace App\Http\Controllers;

use App\Models\Bidang;
use App\Models\Kegiatan;
use App\Models\Mak;
use App\Models\KegiatanRealisasi;
use App\Models\KegiatanRealisasiLampiran;
use App\Models\Pegawai;
use App\Models\Perjadin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MakController extends Controller
{
    public function index(Request $request)
    {
        $user = $request->input('user');
        $tahun = $request->input('tahun');
        $perPage = $request->input('limit', 10);
        $name = $request->input('query');

        $data = Mak::with('kegiatan', 'perjadin')->when($tahun, function ($query, $tahun) {
            return $query->where('tahun', $tahun);
        })->when($user, function ($query) {
            return $query->where('bidang_id', Auth::user()->bidang_id);
        })->when($name, function ($query, $name) {
            return $query->where('kode', 'like', '%' . $name . '%')
                ->orWhere('nama', 'like', '%' . $name . '%')
                ->orWhere('pagu', 'like', '%' . $name . '%');
        })
            ->orderBy('created_at', 'asc')
            ->latest()
            ->paginate($perPage);

        return response()
            ->json(['message' => 'Success', 'data' => $data], 200);


        if ($bidang != 0) {
            $master =  Mak::where('tahun', $tahun)->where('bidang_id', $bidang)->get();
            foreach ($master as $key => $value) {
                $realisasi_kegiatan =  Kegiatan::where('mak_id', $value->id)->where('tahun', $tahun)->where('bidang_id', $bidang)->where('status', 'SELESAI')->sum('total_realisasi');
                $realisasi_perjadin = Perjadin::where('mak_id', $value->id)->where('tahun', $tahun)->where('bidang_id', $bidang)->where('status', 'SELESAI')->sum('total_realisasi');

                $unrealisasi_kegiatan =  Kegiatan::where('mak_id', $value->id)->where('tahun', $tahun)->where('bidang_id', $bidang)->where('status', '!=', 'SELESAI')->sum('total_anggaran');
                $unrealisasi_perjadin = Perjadin::where('mak_id', $value->id)->where('tahun', $tahun)->where('bidang_id', $bidang)->where('status', '!=', 'SELESAI')->sum('total_anggaran');

                $value->realisasi = $realisasi_kegiatan + $realisasi_perjadin;
                $value->unrealisasi = $unrealisasi_kegiatan + $unrealisasi_perjadin;

                $kegiatan = Kegiatan::where('mak_id', $value->id)->where('tahun', $tahun)->where('bidang_id', $bidang)->get();

                $perjadin =  Perjadin::where('mak_id', $value->id)->where('tahun', $tahun)->where('bidang_id', $bidang)->get();

                $value->rincian = [...$kegiatan, ...$perjadin];

                $value->bidang = Bidang::find($value->bidang);
                $value->saldo = $this->cekSaldoMak($value->id, $tahun, $bidang);
            }
        } else if ($bidang == 0) {
            $master =  Mak::where('tahun', $tahun)->get();
            foreach ($master as $key => $value) {
                $realisasi_kegiatan =  Kegiatan::where('mak_id', $value->id)->where('tahun', $tahun)->where('status', 'SELESAI')->sum('total_realisasi');
                $realisasi_perjadin = Perjadin::where('mak_id', $value->id)->where('tahun', $tahun)->where('status', 'SELESAI')->sum('total_realisasi');

                $unrealisasi_kegiatan =  Kegiatan::where('mak_id', $value->id)->where('tahun', $tahun)->where('status', '!=', 'SELESAI')->sum('total_anggaran');
                $unrealisasi_perjadin = Perjadin::where('mak_id', $value->id)->where('tahun', $tahun)->where('status', '!=', 'SELESAI')->sum('total_anggaran');

                $value->realisasi = $realisasi_kegiatan + $realisasi_perjadin;
                $value->unrealisasi = $unrealisasi_kegiatan + $unrealisasi_perjadin;

                $kegiatan = Kegiatan::where('mak_id', $value->id)->where('tahun', $tahun)->get();

                $perjadin =  Perjadin::where('mak_id', $value->id)->where('tahun', $tahun)->get();

                $value->rincian = [...$kegiatan, ...$perjadin];

                $value->bidang = Bidang::find($value->bidang);
                $value->saldo = $this->cekSaldoMak($value->id, $tahun, $bidang);
            }
        }


        return response()->json($master, 200);
    }

    public function store(Request $payload)
    {
        $response = 404;
        $message = 'ERROR';
        $master = Mak::create([
            'kode' => $payload->kode,
            'nama' => $payload->nama,
            'pagu' => $payload->pagu,
            'bidang_id' => $payload->bidang_id,
            'tahun' => $payload->tahun,
            'user_id' => $payload->user['id'],
        ]);

        if ($master) {
            $response = 200;
            $message = $master;
        }

        return response()->json($message, $response);
    }

    public function destroy(Request $payload)
    {
        $id = $payload->input('id');

        $master = Mak::find($id);
        $response = 404;
        if ($master) {
            $master->delete();
            $realisasi = KegiatanRealisasi::where('mak_id', $master->id)->get();
            foreach ($realisasi as $key => $value) {
                $value->delete();
                $lampiran = KegiatanRealisasiLampiran::where('realisasi_id', $value->id)->get();
                foreach ($lampiran as $key => $val) {
                    $val->delete();
                    $file_path = public_path() . $val->file;
                    if (file_exists($file_path)) {
                        unlink($file_path);
                    }
                }
            }
            $response = 200;
        }
        return response()->json($master, $response);
    }

    public function storeRevisi(Request $payload)
    {
        $output = [];
        foreach ($payload->data as $key => $value) {
            $master = Mak::find($value['id']);

            $master->pagu = $value['pagu'];
            $master->save();

            $output[] = $master;
        }

        return response()->json($output, 200);
    }

    public function cekMak(Request $payload)
    {
        $message = 0;
        $kode = $payload->kode;

        $count = Mak::where('kode', $kode)->get()->count();

        if ($count > 0) {
            $message = $count;
        }
        return response()->json($message, 200);
    }

    public function penyerapanSemua(Request $payload)
    {
        $tahun = $payload->input('tahun');

        $bidang = Bidang::all();

        foreach ($bidang as $key => $value) {
            $mak = Mak::where('tahun', $tahun)->where('bidang_id', $value->id);
            $value->pagu = $mak->sum('pagu');
            $value->realisasi = 0;
            foreach ($mak->get() as $key => $x) {
                $realisasi_kegiatan =  Kegiatan::where('mak_id', $x->id)->where('tahun', $tahun)->where('status', 'SELESAI')->sum('total_realisasi');
                $realisasi_perjadin = Perjadin::where('mak_id', $x->id)->where('tahun', $tahun)->where('status', 'SELESAI')->sum('total_realisasi');

                $value->realisasi += $realisasi_kegiatan + $realisasi_perjadin;
            }
        }

        return response()->json($bidang, 200);
    }

    public function cekSaldoMak($id, $tahun, $bidang_id)
    {

        $mak = Mak::find($id);
        if ($bidang_id != 0) {
            $realisasi_kegiatan =  Kegiatan::where('mak_id', $id)->where('tahun', $tahun)->where('bidang_id', $bidang_id)->where('status', 'SELESAI')->sum('total_realisasi');
            $realisasi_perjadin = Perjadin::where('mak_id', $id)->where('tahun', $tahun)->where('bidang_id', $bidang_id)->where('status', 'SELESAI')->sum('total_realisasi');

            $unrealisasi_kegiatan =  Kegiatan::where('mak_id', $id)->where('tahun', $tahun)->where('bidang_id', $bidang_id)->where('status', '!=', 'SELESAI')->sum('total_anggaran');
            $unrealisasi_perjadin = Perjadin::where('mak_id', $id)->where('tahun', $tahun)->where('bidang_id', $bidang_id)->where('status', '!=', 'SELESAI')->sum('total_anggaran');
        } else {
            $realisasi_kegiatan =  Kegiatan::where('mak_id', $id)->where('tahun', $tahun)->where('status', 'SELESAI')->sum('total_realisasi');
            $realisasi_perjadin = Perjadin::where('mak_id', $id)->where('tahun', $tahun)->where('status', 'SELESAI')->sum('total_realisasi');

            $unrealisasi_kegiatan =  Kegiatan::where('mak_id', $id)->where('tahun', $tahun)->where('status', '!=', 'SELESAI')->sum('total_anggaran');
            $unrealisasi_perjadin = Perjadin::where('mak_id', $id)->where('tahun', $tahun)->where('status', '!=', 'SELESAI')->sum('total_anggaran');
        }



        $output['realisasi']  = $realisasi_kegiatan + $realisasi_perjadin;
        $output['unrealisasi'] = $unrealisasi_kegiatan + $unrealisasi_perjadin;

        $output['saldo'] =  $mak->pagu -  $output['realisasi'] -  $output['unrealisasi'];
        return $output;
    }

    public function rencanaKegiatan(Request $payload)
    {

        $tahun = $payload->input('tahun');
        $bidang_id = $payload->input('bidang_id');

        $unrealisasi_kegiatan =  Kegiatan::where('bidang_id', $bidang_id)->where('tahun', $tahun)->where('status', '!=', 'SELESAI')->get();
        $unrealisasi_perjadin = Perjadin::where('bidang_id', $bidang_id)->where('tahun', $tahun)->where('status', '!=', 'SELESAI')->get();

        $master = [...$unrealisasi_kegiatan, ...$unrealisasi_perjadin];

        return response()->json($master, 200);
    }

    public function cek(Request $payload)
    {
        $bidang_id = $payload->input('bidang_id');
        $tahun = $payload->input('tahun');

        $bulan = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

        foreach ($bulan as $key => $value) {
            $rencana_kegiatan = Kegiatan::where('tahun', $tahun)->where('bidang_id', $bidang_id)->whereMonth('created_at', $value)->sum('total_anggaran');
            $realisasi_kegiatan = Kegiatan::where('tahun', $tahun)->where('bidang_id', $bidang_id)->where('status', 'SELESAI')->whereMonth('created_at', $value)->sum('total_realisasi');

            $rencana_perjadin = Perjadin::where('tahun', $tahun)->where('bidang_id', $bidang_id)->whereMonth('created_at', $value)->sum('total_anggaran');
            $realisasi_perjadin = Perjadin::where('tahun', $tahun)->where('bidang_id', $bidang_id)->where('status', 'SELESAI')->whereMonth('created_at', $value)->sum('total_realisasi');

            $detail_rencana[] = $rencana_kegiatan + $rencana_perjadin;
            $detail_realisasi[] = $realisasi_kegiatan + $realisasi_perjadin;
        }
        $rencana['name'] = 'RENCANA';
        $rencana['data'] = $detail_rencana;
        $realisasi['name'] = 'REALISASI';
        $realisasi['data'] = $detail_realisasi;

        $master[] = $rencana;
        $master[] = $realisasi;

        return response()->json($master, 200);
    }
}
