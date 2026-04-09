<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pricelists extends Model
{
    use HasFactory;

    protected $fillable = [
        'kategori_bahan_id',
        'harga',
        'gambar'
    ];

    public function kategori()
    {
        return $this->belongsTo(KategoriBahan::class, 'kategori_bahan_id');
    }
}
