<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DetailProduk extends Model
{
    protected $table = 'detail_produk';

    protected $fillable = [
        'produk_id',
        'bahan',
        'warna',
        'ukuran',
        'harga',
    ];

    public function produk()
    {
        return $this->belongsTo(Produk::class, 'produk_id');
    }

    public function pesananItem()
    {
        return $this->hasMany(PesananItem::class, 'detail_produk_id');
    }
}
