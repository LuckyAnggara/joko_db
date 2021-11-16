<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\KartuPersediaan;
use App\Models\Pembelian;
use App\Models\PembelianDetail;
use App\Models\PembelianLampiran;
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
}
