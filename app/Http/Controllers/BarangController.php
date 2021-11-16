<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\Bidang;
use App\Models\KartuPersediaan;
use App\Models\Pegawai;
use App\Models\Pembelian;
use App\Models\PembelianDetail;
use App\Models\PembelianLampiran;
use App\Models\PermintaanPersediaan;
use App\Models\PermintaanPersediaanDetail;
use App\Models\PermintaanPersediaanLampiran;
use App\Models\PermintaanPersediaanLog;
use App\Models\User;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;


class BarangController extends Controller
{
  
    public function index(Request $payload){
        $master =  Barang::all();
        foreach ($master as $key => $value) {
            $value->saldo = KartuPersediaan::where('barang_id', $value->id)->get();

            $debit = KartuPersediaan::where('barang_id', $value->id)->sum('debit');
            $kredit = KartuPersediaan::where('barang_id', $value->id)->sum('kredit');
            $value->saldo_akhir = $debit - $kredit;
        }
        return response()->json($master, 200);
    }

    public function storeBarang(Request $payload){

        $master = Barang::create([
            'nama' => strtoupper($payload->nama),
            'satuan' => strtoupper($payload->satuan),
        ]);
        
        return response()->json($master, 200);
    }

    public function editBarang(Request $payload){
        $master = Barang::find($payload->id);
        $master->nama = strtoupper($payload->nama);
        $master->satuan = strtoupper($payload->satuan);
        $master->save();
        
        return response()->json($master, 200);
    }

    public function indexPembelian(Request $payload){
        $master = Pembelian::all();

        foreach ($master as $key => $value) {
            $value->lampiran = PembelianLampiran::where('pembelian_id', $value->id)->get();
            $value->data_barang = PembelianDetail::where('pembelian_id', $value->id)->get();

            foreach ($value->data_barang as $key => $xx) {
                $xx->barang = Barang::find($xx->barang_id);
            }

        }
        return response()->json($master, 200);
    }

    public function storePembelian(Request $payload){
        
        $master = Pembelian::create([
            'no_invoice' => $payload->no_invoice,
            'tanggal_invoice' => $payload->tanggal_invoice,
            'keterangan' => $payload->keterangan,
            'nama_supplier' => $payload->nama_supplier,
            'user_id' => $payload->user_data['id'],
        ]);

        if($master){
            foreach ($payload->data_barang as $key => $value) {
                $detail[] = PembelianDetail::create([
                    'pembelian_id' => $master->id,
                    'barang_id' => $value['id'],
                    'jumlah' => $value['jumlah'],
                ]);

                $kartuPersediaan[] = KartuPersediaan::create([
                    'barang_id' => $value['id'],
                    'debit' => $value['jumlah'],
                    'kredit' => 0,
                    'user_id' => $payload->user_data['id'],
                ]);
            }
            $master->detail = $detail;
            $master->kartuPersediaan = $kartuPersediaan;
        }
        return response()->json($master, 200);

    }

    public function destroyPembelian(Request $payload){
        $id = $payload->id;

        $master = Pembelian::find($id);
        $master->delete();

        $detail = PembelianDetail::where('pembelian_id',$master->id)->get();

        foreach ($detail as $key => $value) {
            $value->delete();

            $kartuPersediaan[] = KartuPersediaan::create([
                'barang_id' => $value->barang_id,
                'debit' => 0,
                'kredit' => $value->jumlah,
                'user_id' => $value->id,
            ]);
        }


        $lampiran = PembelianLampiran::where('pembelian_id',$master->id)->get();

        foreach ($lampiran as $key => $value) {
            if (Storage::disk('public')->exists($value->file)) {
                Storage::disk('public')->delete($value->file);
            }
        }
    }

    public function uploadLampiranPembelian(Request $payload){
        $output = [];
        $id = $payload->id;
        
        if($payload->file('lampiran')){
            foreach ($payload->file('lampiran') as $file) {
            $path = Storage::disk('public')->put('pembelian/lampiran',$file);
            $nama = $file->getClientOriginalName();
            $data = PembelianLampiran::create([
                'pembelian_id' => $payload->id,
                'nama' => $nama,
                'file' => $path,
                'user_id' => $payload->user_id,
            ]);
            $output[] = $data;
            }
        }
        return response()->json($output, 200);

    }

    public function downloadLampiran(Request $payload){
        $id = $payload->id;
        
        $master = PembelianLampiran::find($id);
        if (Storage::disk('public')->exists($master->file)) {
            return Storage::disk('public')->download($master->file);
        }
    }

    public function indexPermintaan(Request $payload){
        $bidang_id = $payload->input('bidang_id');
        $tahun_id = $payload->input('tahun_id');

        $master =  PermintaanPersediaan::where('tahun_id', $tahun_id)->where('bidang_id', $bidang_id)->get();
        if($bidang_id == 0){
            $master =  PermintaanPersediaan::where('tahun_id', $tahun_id)->get();
        }
        foreach ($master as $key => $value) {
            $value->lampiran = PermintaanPersediaanLampiran::where('permintaan_persediaan_id', $value->id)->get();
            $value->data_barang = PermintaanPersediaanDetail::where('permintaan_persediaan_id', $value->id)->get();
            $value->log = PermintaanPersediaanLog::where('permintaan_persediaan_id', $value->id)->get();
            $value->bidang = Bidang::find($value->bidang_id);
            $value->user = User::find($value->user_id);
            $value->user['pegawai'] = Pegawai::find($value->user['pegawai_id']);
            foreach ($value->data_barang as $key => $xx) {
                $xx->barang = Barang::find($xx->barang_id);
            }


        }
        return response()->json($master, 200);
    }

    public function storePermintaan(Request $payload){
        
        $master = PermintaanPersediaan::create([
            'keterangan' => $payload->keterangan,
            'tahun_id' => $payload->tahun['id'],
            'user_id' => $payload->user_data['id'],
            'bidang_id' => $payload->user_data['bidang_id'],
            'status' => 'PENGAJUAN'
        ]);

        if($master){
            foreach ($payload->data_barang as $key => $value) {
                $detail[] = PermintaanPersediaanDetail::create([
                    'permintaan_persediaan_id' => $master->id,
                    'barang_id' => $value['id'],
                    'jumlah' => $value['jumlah'],
                ]);
            }
            $master->detail = $detail;
            $this->storeLog($master->id,'PENGAJUAN', 'PERJADIN TELAH DIBUAT, OLEH '.$payload->user_data['pegawai']['nama'], $payload->user_data,null);
        }
        return response()->json($master, 200);
    }

    public function uploadLampiranPermintaan(Request $payload){
        $output = [];
        $id = $payload->id;
        
        if($payload->file('lampiran')){
            foreach ($payload->file('lampiran') as $file) {
            $path = Storage::disk('public')->put('permintaan/lampiran',$file);
            $nama = $file->getClientOriginalName();
            $data = PermintaanPersediaanLampiran::create([
                'permintaan_persediaan_id' => $payload->id,
                'nama' => $nama,
                'file' => $path,
                'user_id' => $payload->user_id,
            ]);
            $output[] = $data;
            }
        }
        return response()->json($output, 200);

    }

    public function storeLog($id, $status_log, $message_log, $user_data, $catatan = null){
        $log = PermintaanPersediaanLog::create([
            'permintaan_persediaan_id' => $id,
            'status' => $status_log,
            'catatan'=> $catatan,
            'bidang_id'=> $user_data['bidang_id'],
            'user_id'=> $user_data['id'],
            'keterangan' => $message_log,
        ]);
    }

}
