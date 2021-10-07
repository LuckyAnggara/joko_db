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

// KEGIATAN / MAK
Route::group(['prefix' => 'kegiatan'], function () {
    //GET
    Route::get('/', 'KegiatanController@index');
});
// REALISASI
Route::group(['prefix' => 'realisasi'], function () {
    //GET
    Route::get('/', 'RealisasiController@index');
});
// TAHUN
Route::group(['prefix' => 'tahun'], function () {
    //GET
    Route::get('/', 'TahunController@index');
});
// TAHUN
Route::group(['prefix' => 'pegawai'], function () {
    //GET
    Route::get('/', 'PegawaiController@index');
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
    // Route::delete('/lampiran/delete/{id}', 'RktController@destroy');
});