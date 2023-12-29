<?php

namespace App\Http\Controllers;

use App\Models\Bidang;
use App\Models\JenisKegiatan;
use App\Models\Kegiatan;
use App\Models\Perjadin;
use App\Models\KegiatanLampiran;
use App\Models\KegiatanLog;
use App\Models\Mak;
use App\Models\Pegawai;
use App\Models\Tahun;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class KegiatanController extends BaseController
{

    public function index(Request $payload)
    {

        $user = $payload->input('user');
        $status = $payload->input('status');
        $tahun = $payload->input('tahun');
        $perPage = $payload->input('limit', 10);
        $name = $payload->input('query');

        $perPage = $perPage == 'SEMUA' ? '1000000' : $perPage;

        $data = Kegiatan::with('mak', 'kegiatan', 'bidang')->when($tahun, function ($query, $tahun) {
            return $query->where('tahun', $tahun);
        })->when($user, function ($query) {
            return $query->where('bidang_id', Auth::user()->bidang_id);
        })->when($status, function ($query, $status) {
            return $query->where('status', $status);
        })->when($name, function ($query, $name) {
            return $query->where('uraian', 'like', '%' . $name . '%')
                ->orWhere('output', 'like', '%' . $name . '%')
                ->orWhere('total_anggaran', 'like', '%' . $name . '%');
        })
            ->orderBy('created_at', 'desc')
            ->latest()
            ->paginate($perPage);

        return $this->sendResponse($data, 'Data fetched');
    }

    public function show($id)
    {
        $result = Kegiatan::where('id', $id)
            ->with('mak', 'kegiatan', 'bidang', 'lampiran')
            ->first();
        if ($result) {
            return $this->sendResponse($result, 'Data fetched');
        }
        return $this->sendError('Data not found');
    }

    public function storeRencana(Request $payload)
    {

        $data = json_decode($payload->getContent());
        try {
            DB::beginTransaction();
            $result = Kegiatan::create([
                'nomor_kwitansi' => $data->tahun . '-' . $this->makeNomorKwitansi(),
                'uraian' => $data->uraian,
                'output' => $data->output,
                'total_anggaran' => $data->total_anggaran,
                'lokasi' => $data->lokasi,
                'jenis_kegiatan_id' => $data->jenis_kegiatan->id,
                'status' => 'RENCANA',
                'status_realisasi' => 'BELUM',
                'mak_id' => $data->mak->id,
                'tanggal_rencana_kegiatan' => $data->tanggal_rencana_kegiatan,
                'tahun' => $data->tahun,
                'bidang_id' => Auth::user()->bidang_id,
                'user_id' => Auth::user()->id,
            ]);
            if ($result) {
                $this->storeLog($result->id, 'RENCANA', 'RENCANA KEGIATAN TELAH DIBUAT, OLEH ' .  Auth::user()->nama, Auth::user(), null);
            }
            DB::commit();
            return $this->sendResponse($result, 'Data berhasil dibuat');
        } catch (\Exception $e) {
            DB::rollBack();
            return $this->sendError($e->getMessage(), 'Failed to saved data');
        }
    }

    public function destroy(Request $request)
    {
        $id = $request->id;

        $master = Kegiatan::find($id);

        if ($master) {
            $master->delete();

            $log = KegiatanLog::where('kegiatan_id', $master->id)->get();
            foreach ($log as $key => $log) {
                $log->delete();
            }
            $kegiatan_lampiran = KegiatanLampiran::where('kegiatan_id', $master->id)->get();
            foreach ($kegiatan_lampiran as $key => $lampiran) {
                $lampiran->delete();
                if (Storage::disk('public')->exists($lampiran->file)) {
                    Storage::disk('public')->delete($lampiran->file);
                }
            }
        }
        return response()->json($master, 200);
    }


    public function uploadLampiranRencana(Request $payload)
    {
        $output = [];
        $id = $payload->id;

        foreach ($payload->file('lampiran') as $file) {
            $path = Storage::disk('public')->put('kegiatan', $file);
            $nama = $file->getClientOriginalName();
            $data = KegiatanLampiran::create([
                'kegiatan_id' => $id,
                'user_id' => Auth::user()->id,
                'nama' => $nama,
                'file' => $path,
            ]);
            $output[] = $data;
        }


        return response()->json($output, 200);
    }

    public function downloadLampiran(Request $payload)
    {
        $id = $payload->id;

        $master = KegiatanLampiran::find($id);
        if (Storage::disk('public')->exists($master->file)) {
            return Storage::disk('public')->download($master->file);
        }
    }

    public function destroyLampiran(Request $payload)
    {
        $id = $payload->id;

        $master = KegiatanLampiran::find($id);
        $master->delete();

        if (Storage::disk('public')->exists($master->file)) {
            Storage::disk('public')->delete($master->file);
        }
        return response()->json($master, 200);
    }

    public function status(Request $request)
    {
        $response = 404;
        $id = $request->id;
        $messages = 'ERROR';
        $master = Kegiatan::find($id);

        if ($master) {
            $response = 200;
            $master->status =  $request->status;
            $master->save();
            $this->storeLog($master->id, $request->status_log, $request->message_log . ' oleh ' . $request->user_data['pegawai']['nama'], $request->user_data, $request->catatan);
            $messages = $master;
        }

        return response()->json($messages, $response);
    }

    public function storeLog($id, $status_log, $message_log, $user_data, $catatan = null)
    {
        $log = KegiatanLog::create([
            'kegiatan_id' => $id,
            'status' => $status_log,
            'catatan' => $catatan,
            'bidang_id' => $user_data['bidang_id'],
            'user_id' => $user_data['id'],
            'keterangan' => $message_log,
        ]);
    }

    public function updateRealisasi(Request $payload)
    {
        $id = $payload->id;

        $master = Kegiatan::find($id);

        $master->tanggal_realisasi_kegiatan = $payload->tanggal_realisasi_kegiatan;
        $master->total_realisasi = $payload->total_realisasi;
        $master->checker_id = $payload->checker['id'];
        $master->ppk_id = $payload->ppk['id'];
        $master->bendahara_id = $payload->bendahara['id'];
        $master->status_realisasi = 'SUDAH';

        $master->save();
    }

    public function editRealisasi(Request $payload)
    {
        $id = $payload->id;

        $master = Kegiatan::find($id);

        $master->tanggal_realisasi_kegiatan = $payload->tanggal_realisasi_kegiatan;
        $master->total_realisasi = $payload->total_realisasi;
        $master->checker_id = $payload->checker['id'];
        $master->ppk_id = $payload->ppk['id'];
        $master->bendahara_id = $payload->bendahara['id'];
        $master->status_realisasi = 'SUDAH';

        $master->save();
        return response()->json($master, 200);
    }


    public function editMak(Request $payload)
    {
        $id = $payload->id;
        $master = Kegiatan::find($id);
        $master->mak_id = $payload->mak['id'];

        $master->save();
        return response()->json($master, 200);
    }

    public function editUmum(Request $payload)
    {
        $id = $payload->id;
        $master = Kegiatan::find($id);
        $master->tahun = $payload->tahun;
        $master->tanggal_rencana_kegiatan = $payload->tanggal_rencana_kegiatan;
        $master->total_anggaran = $payload->total_anggaran;
        $master->jenis_kegiatan_id = $payload->jenis_kegiatan['id'];
        $master->lokasi = $payload->lokasi;
        $master->output = $payload->output;
        $master->uraian = $payload->uraian;

        $master->save();
        return response()->json($master, 200);
    }

    public function makeNomorKwitansi()
    {
        $master = Kegiatan::all()->last();
        $output = 1;
        if ($master) {
            $dd = explode('-', $master->nomor_kwitansi);
            $output = $dd[1] + 1;
        }
        return $output;
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
}
