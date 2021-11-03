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
    //POST
    Route::post('/store', 'MakController@store');
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
});
// BIDANG
Route::group(['prefix' => 'bidang'], function () {
    //GET
    Route::get('/', 'BidangController@index');
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
// PRINT
Route::group(['prefix' => 'print'], function () {
    //GET
    Route::get('/download-spd', 'PrintController@printSpd');
    Route::get('/download-spb', 'PrintController@printSpb');
    Route::get('/download-rab', 'PrintController@printRab');
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