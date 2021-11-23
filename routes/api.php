<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
// AUTH
Route::group(['prefix' => 'auth'], function () {
    //POST
    Route::post('/login', 'AuthController@login');
});


// MAK
Route::group(['prefix' => 'mak'], function () {
    //GET
    Route::get('/', 'MakController@index');
    Route::get('/penyerapan-semua', 'MakController@penyerapanSemua');
    //POST
    Route::post('/store', 'MakController@store');
    Route::post('/store-revisi', 'MakController@storeRevisi');
    Route::post('/cek-kode-mak', 'MakController@cekMak');
    //DELETE
    Route::delete('/delete-mak', 'MakController@destroy');
});


// REALISASI
Route::group(['prefix' => 'realisasi'], function () {
    //GET
    Route::get('/', 'RealisasiController@index');
    Route::get('/show', 'RealisasiController@show');
    Route::get('/download-lampiran', 'RealisasiController@downloadLampiran');
    Route::get('/laporan-rincian', 'RealisasiController@laporanRincian');
    //STORE
    Route::post('/store', 'RealisasiController@store');
    Route::post('/upload-lampiran', 'RealisasiController@uploadLampiran');
    Route::post('/update-status', 'RealisasiController@updateStatus');
    //DESTROY
    Route::delete('/delete-realisasi', 'RealisasiController@destroy');
});
// TAHUN
Route::group(['prefix' => 'tahun'], function () {
    //GET
    Route::get('/', 'TahunController@index');
});
// PEGAWAI
Route::group(['prefix' => 'pegawai'], function () {
    //GET
    Route::get('/', 'PegawaiController@index');
    //POST
    Route::post('/store', 'PegawaiController@store');
    Route::post('/store-kompetensi', 'PegawaiController@storeKompetensi');
    Route::post('/store-lampiran', 'PegawaiController@storeLampiran');
    Route::post('/store-lampiran-kompetensi', 'PegawaiController@storeLampiranKompetensi');
    //DESTROY
    Route::delete('/delete-kompetensi', 'PegawaiController@destroyKompetensi');
});
// BIDANG
Route::group(['prefix' => 'bidang'], function () {
    //GET
    Route::get('/', 'BidangController@index');
});
// BIDANG ILMU
Route::group(['prefix' => 'bidang-ilmu'], function () {
    //GET
    Route::get('/', 'BidangIlmuController@index');
});
// BIDANG
Route::group(['prefix' => 'jenis-kegiatan'], function () {
    //GET
    Route::get('/', 'JenisKegiatanController@index');
});
// PERAN
Route::group(['prefix' => 'peran'], function () {
    //GET
    Route::get('/', 'PeranController@index');
});
// GOLONGAN
Route::group(['prefix' => 'golongan'], function () {
    //GET
    Route::get('/', 'GolonganController@index');
});
// JABATAN
Route::group(['prefix' => 'jabatan'], function () {
    //GET
    Route::get('/', 'JabatanController@index');
});
// KANTOR WILAYAH
Route::group(['prefix' => 'kanwil'], function () {
    //GET
    Route::get('/', 'KanwilController@index');
});
// URUSAN
Route::group(['prefix' => 'urusan'], function () {
    //GET
    Route::get('/', 'UrusanController@index');
});

// KEGIATAN BIASA
Route::group(['prefix' => 'kegiatan'], function () {
    //GET
    Route::get('/', 'KegiatanController@index');
    Route::get('/show', 'KegiatanController@show');
    Route::get('/download-lampiran', 'KegiatanController@downloadLampiran');
    Route::get('/laporan-rincian', 'KegiatanController@laporanRincian');
    //STORE
    Route::post('/store-rencana', 'KegiatanController@storeRencana');
    Route::post('/upload-lampiran-rencana', 'KegiatanController@uploadLampiranRencana');
    Route::post('/update-realisasi', 'KegiatanController@updateRealisasi');
    Route::post('/upload-lampiran-tambahan', 'KegiatanController@uploadLampiranRencana');
    Route::post('/status', 'KegiatanController@status');
    //DESTROY
    Route::delete('/delete-kegiatan', 'KegiatanController@destroy');
    Route::delete('/delete-lampiran', 'PerjadinController@destroyLampiran');
});
// PERJADIN
Route::group(['prefix' => 'perjadin'], function () {
    //GET
    Route::get('/', 'PerjadinController@index');
    Route::get('/generate', 'PerjadinController@generateKodePerjadin');
    Route::get('/download-lampiran', 'PerjadinController@downloadLampiran');
    //POST
    Route::post('/store', 'PerjadinController@store');
    Route::post('/store-realisasi', 'PerjadinController@storeRealisasi');
    Route::post('/upload-lampiran', 'PerjadinController@uploadLampiran');
    Route::post('/upload-perjadin-realisasi-lampiran', 'PerjadinController@uploadPerjadinRealisasiLampiran');
    Route::post('/status', 'PerjadinController@status');
    //DELETE
    Route::delete('/delete-perjadin', 'PerjadinController@destroy');
    Route::delete('/delete-lampiran', 'PerjadinController@destroyLampiran');
});

// BARANG
Route::group(['prefix' => 'barang'], function () {
    //GET
    Route::get('/', 'BarangController@index');
    Route::get('/daftar-pembelian', 'BarangController@indexPembelian');
    Route::get('/daftar-permintaan', 'BarangController@indexPermintaan');
    Route::get('/download-lampiran', 'BarangController@downloadLampiran');
    //POST
    Route::post('/store-barang', 'BarangController@storeBarang');
    Route::post('/edit-barang', 'BarangController@editBarang');
    Route::post('/status-permintaan', 'BarangController@statusPermintaan');

    Route::post('/store-pembelian', 'BarangController@storePembelian');
    Route::post('/store-pembelian-lampiran', 'BarangController@uploadLampiranPembelian');

    
    Route::post('/store-permintaan', 'BarangController@storePermintaan');
    Route::post('/proses-permintaan', 'BarangController@prosesPermintaan');
    Route::post('/store-permintaan-lampiran', 'BarangController@uploadLampiranPermintaan');

    //DELETE
    Route::delete('/delete-pembelian', 'BarangController@destroyPembelian');
    Route::delete('/delete-permintaan', 'BarangController@destroyPermintaan');
});
// PRINT
Route::group(['prefix' => 'print'], function () {
    //GET
    Route::get('/download-spd', 'PrintController@printSpd');
    Route::get('/download-dpr', 'PrintController@printDpr');
    Route::get('/download-kuitansi', 'PrintController@printKuitansi');
    Route::get('/download-sptjm', 'PrintController@printSptjm');
    Route::get('/download-spb', 'PrintController@printSpb');
    Route::get('/download-dop', 'PrintController@printDOP');
    Route::get('/download-rab-perjadin', 'PrintController@printRabPerjadin');
});






// MASTER
Route::group(['prefix' => 'master'], function () {
    //GET
    Route::get('/area', 'RktController@indexArea');
    Route::get('/rkt/{tahun}', 'RktController@adminRKT');
    // //STORE
    Route::post('/area/store', 'RktController@storeArea');
    Route::post('/rkt/store', 'RktController@storeRKT');
    // //DELETE
    //DELETE
     Route::delete('/rkt/delete/{id}', 'RktController@destroyRKT');
});