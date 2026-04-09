<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Produk extends Model
{
    protected $table = 'produk';

    protected $fillable = [
        'nama_produk',
        'gambar',
        'deskripsi',
    ];

    public function detailProduk()
    {
        return $this->hasMany(DetailProduk::class, 'produk_id');
    }
}
