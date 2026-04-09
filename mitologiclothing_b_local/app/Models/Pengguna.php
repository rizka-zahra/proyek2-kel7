<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Laravel\Sanctum\HasApiTokens;

class Pengguna extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'pengguna';

    protected $fillable = [
        'nama_lengkap',
        'no_telephone',
        'keterangan',
        'status_akses',
        'activation_token',
        'activation_token_expired_at',
        'password',
        'approved_at',
        'last_login_at',
    ];

    protected $hidden = [
        'password',
        'activation_token',
    ];

    protected $casts = [
        'activation_token_expired_at' => 'datetime',
        'approved_at' => 'datetime',
        'last_login_at' => 'datetime',
    ];
}
