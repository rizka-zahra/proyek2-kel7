<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Artikel extends Model
{
    protected $table = 'artikel';

    protected $fillable = [
        'kategori_id',
        'judul',
        'isi',
        'gambar',
        'tanggal_publish'
    ];

    public function kategori()
    {
        return $this->belongsTo(KategoriArtikel::class, 'kategori_id');
    }
}
