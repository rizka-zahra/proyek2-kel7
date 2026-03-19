<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class KategoriBahan extends Model
{
    protected $table = 'kategori_bahan';

    protected $fillable = ['nama_kategori'];

    public function stok()
    {
        return $this->hasMany(Stok::class);
    }
}
