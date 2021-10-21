<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kanwil extends Model
{
    use HasFactory;
    protected $table = 'kanwil';
    protected $guarded = [
        'id',
    ];
    public $primaryKey = 'id';
}
