<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Pengguna;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class ActivationController extends Controller
{
    public function checkToken(Request $request)
    {
        $request->validate([
            'token' => ['required', 'string'],
        ]);

        $pengguna = Pengguna::where('activation_token', $request->token)
            ->where('status_akses', 'approved')
            ->whereNotNull('activation_token_expired_at')
            ->where('activation_token_expired_at', '>', now())
            ->first();

        if (!$pengguna) {
            return response()->json([
                'message' => 'Token tidak valid atau sudah kadaluarsa.'
            ], 422);
        }

        return response()->json([
            'message' => 'Token valid.',
            'data' => [
                'nama_lengkap' => $pengguna->nama_lengkap,
                'no_telephone' => $pengguna->no_telephone,
            ]
        ]);
    }

    public function setPassword(Request $request)
    {
        $request->validate([
            'token' => ['required', 'string'],
            'password' => ['required', 'string', 'min:6', 'confirmed'],
        ]);

        $pengguna = Pengguna::where('activation_token', $request->token)
            ->where('status_akses', 'approved')
            ->whereNotNull('activation_token_expired_at')
            ->where('activation_token_expired_at', '>', now())
            ->first();

        if (!$pengguna) {
            return response()->json([
                'message' => 'Token tidak valid atau sudah kadaluarsa.'
            ], 422);
        }

        $pengguna->update([
            'password' => Hash::make($request->password),
            'status_akses' => 'active',
            'activation_token' => null,
            'activation_token_expired_at' => null,
        ]);

        $token = $pengguna->createToken('flutter-user-token')->plainTextToken;

        return response()->json([
            'message' => 'Akun berhasil diaktifkan.',
            'token' => $token,
            'data' => [
                'id' => $pengguna->id,
                'nama_lengkap' => $pengguna->nama_lengkap,
                'no_telephone' => $pengguna->no_telephone,
                'status_akses' => $pengguna->status_akses,
            ]
        ]);
    }
}
