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

// BIDANG
Route::group(['prefix' => 'bidang'], function () {
    //GET
    Route::get('/', 'BidangController@index');
});

// KEGIATAN / MAK
Route::group(['prefix' => 'kegiatan'], function () {
    //GET
    Route::get('/', 'KegiatanController@index');
    //POST
    Route::post('/store', 'KegiatanController@store');
    Route::post('/cek-kode-mak', 'KegiatanController@cekMak');
    //DELETE
    Route::delete('/delete-kegiatan', 'KegiatanController@destroy');
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
// PERJADIN
Route::group(['prefix' => 'perjadin'], function () {
    //GET
    Route::get('/', 'PerjadinController@index');
    //POST
    Route::post('/store', 'PerjadinController@store');
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