<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Stok extends Model
{
    protected $table = 'stok';
    protected $primaryKey = 'id_stok';

    protected $fillable = [
        'kategori_bahan_id',
        'detail_bahan',
        'stok',
        'gambar'
    ];

    public function kategori()
    {
        return $this->belongsTo(KategoriBahan::class, 'kategori_bahan_id');
    }
}
