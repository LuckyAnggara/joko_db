<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KegiatanLampiran extends Model
{
    use HasFactory;
    protected $table = 'kegiatan_lampiran';
    protected $guarded = [
        'id',
    ];
    public $primaryKey = 'id';
    protected $fillable = [
        'kegiatan_id',
        'user_id',
        'nama',
        'file'
    ];
    public $timestamps = true;
}
