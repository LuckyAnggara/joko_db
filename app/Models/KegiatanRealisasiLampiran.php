<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KegiatanRealisasiLampiran extends Model
{
    use HasFactory;
    protected $table = 'kegiatan_realisasi_lampiran';
    protected $guarded = [
        'id',
    ];
    public $primaryKey = 'id';
    protected $fillable = [
        'realisasi_id',
        'nama',
        'file'
    ];
    public $timestamps = true;
}
