<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Mak extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'mak';
    protected $guarded = [
        'id',
    ];
    public $primaryKey = 'id';
    public $timestamps = true;
    protected $dates = ['deleted_at'];
    protected $appends = ['realisasi'];


    public function kegiatan()
    {
        return $this->hasMany(Kegiatan::class, 'mak_id', 'id')->orderBy('created_at');
    }

    public function perjadin()
    {
        return $this->hasMany(Perjadin::class, 'mak_id', 'id')->orderBy('created_at');
    }

    public function getRealisasiAttribute($value)
    {
        return $value;
        return $this->kegiatan->where('status', '!=', 'SELESAI')->sum('total_anggaran');
        return $this->kegiatan->where('status', 'SELESAI')->sum('total_realisasi');
    }

    public function getUnrealisasiAttribute()
    {
        return [
            'realisasi' => $this->beginning_balance ?  $this->beginning_balance->stock : 0,
            'unrealisasi' => $this->beginning_balance ? $this->beginning_balance->price : 0,
            'balance' => ($this->beginning_balance ?  $this->beginning_balance->stock : 0) * ($this->beginning_balance ? $this->beginning_balance->price : 0),
        ];
    }

    // public function price()
    // {
    //     return $this->hasOne(ItemSellingPrice::class, 'item_id', 'id')->ofMany('created_at', 'max');
    // }

    // public function beginning_balance()
    // {
    //     return $this->hasOne(ItemBeginningStock::class, 'item_id', 'id')->latestOfMany();
    // }

    // public function getBegBalanceAttribute()
    // {
    //     return [
    //         'stock' => $this->beginning_balance ?  $this->beginning_balance->stock : 0,
    //         'price' => $this->beginning_balance ? $this->beginning_balance->price : 0,
    //         'balance' => ($this->beginning_balance ?  $this->beginning_balance->stock : 0) * ($this->beginning_balance ? $this->beginning_balance->price : 0),
    //     ];
    // }

    // public function getInStockAttribute()
    // {
    //     $mutation = $this->hasMany(ItemMutation::class, 'item_id', 'id')->orderBy('created_at');
    //     return $mutation->sum('debit');
    // }

    // public function getOutStockAttribute()
    // {
    //     $mutation = $this->hasMany(ItemMutation::class, 'item_id', 'id')->orderBy('created_at');
    //     return $mutation->sum('credit');
    // }

    // public function getEndingStockAttribute()
    // {
    //     $mutation = $this->hasMany(ItemMutation::class, 'item_id', 'id')->orderBy('created_at');
    //     return $this->beginning_balance->stock ?? 0 + $mutation->sum('debit') - $mutation->sum('credit');
    // }

    // public function getTaxStatusAttribute()
    // {
    //     return $this->selling_tax_id == 1 ? false : true;
    // }

    // public function getCanTaxAttribute()
    // {
    //     return $this->selling_tax_id == 1 ? false : true;
    // }
    // public function getTaxValueAttribute()
    // {
    //     return $this->sell_tax->value ?? 0;
    // }
    // public function getShowImageAttribute()
    // {
    //     if ($this->image == null) return Storage::url('dummy/product.png');
    //     return (Storage::url($this->image));
    // }
}
