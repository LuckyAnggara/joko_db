<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PerjadinRealisasiUangHotel extends Model
{
    use HasFactory;
    protected $table = 'perjadin_realisasi_uang_hotel';
    protected $guarded = [
        'id',
    ];
    public $primaryKey = 'id';
    public $timestamps = true;
}
