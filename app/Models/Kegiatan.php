<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kegiatan extends Model
{
    use HasFactory;
    protected $table = 'kegiatan';
    protected $guarded = [
        'id',
    ];
    public $primaryKey = 'id';
    public $timestamps = true;
    public $date = ['tanggal_kegiatan', 'created_at', 'deleted_at'];

    public function mak()
    {
        return $this->hasOne(Mak::class, 'id', 'mak_id');
    }

    public function bidang()
    {
        return $this->hasOne(Bidang::class, 'id', 'bidang_id');
    }
    public function log()
    {
        return $this->hasMany(KegiatanLog::class, 'kegiatan_id', 'id');
    }
    // public function kegiatan()
    // {
    //     return $this->hasOne(JenisKegiatan::class, 'id', 'jenis_kegiatan_id');
    // }

    public function lampiran()
    {
        return $this->hasMany(KegiatanLampiran::class, 'kegiatan_id', 'id');
    }

    public function user()
    {
        return $this->hasOne(User::class, 'id', 'user_id');
    }
}
