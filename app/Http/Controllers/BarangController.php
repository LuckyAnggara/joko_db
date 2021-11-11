<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\KartuPersediaan;
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
}
