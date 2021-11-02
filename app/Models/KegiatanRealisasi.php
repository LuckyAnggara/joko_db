<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KegiatanRealisasi extends Model
{
    use HasFactory;
    protected $table = 'kegiatan_realisasi';
    protected $guarded = [
        'id',
    ];
    public $primaryKey = 'id';
    public $timestamps = true;
    public $date = ['tanggal_spb','created_at','deleted_at'];
}
