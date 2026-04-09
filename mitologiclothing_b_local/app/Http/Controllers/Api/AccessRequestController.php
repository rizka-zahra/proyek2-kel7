<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Pengguna;
use Illuminate\Http\Request;

class AccessRequestController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama_lengkap' => ['required', 'string', 'max:255'],
            'no_telephone' => ['required', 'string', 'max:255'],
            'keterangan' => ['nullable', 'string'],
        ]);

        $pengguna = Pengguna::where('no_telephone', $validated['no_telephone'])->first();

        if ($pengguna && in_array($pengguna->status_akses, ['approved', 'active'])) {
            return response()->json([
                'message' => 'Nomor ini sudah memiliki akses atau sedang menunggu aktivasi.'
            ], 422);
        }

        if (!$pengguna) {
            $pengguna = Pengguna::create([
                'nama_lengkap' => $validated['nama_lengkap'],
                'no_telephone' => $validated['no_telephone'],
                'keterangan' => $validated['keterangan'] ?? 'Pengguna Belanja',
                'status_akses' => 'pending',
            ]);
        } else {
            $pengguna->update([
                'nama_lengkap' => $validated['nama_lengkap'],
                'keterangan' => $validated['keterangan'] ?? 'Pengguna Belanja',
                'status_akses' => 'pending',
                'activation_token' => null,
                'activation_token_expired_at' => null,
            ]);
        }

        return response()->json([
            'message' => 'Permintaan akses berhasil dikirim.',
            'data' => $pengguna,
        ]);
    }
}
