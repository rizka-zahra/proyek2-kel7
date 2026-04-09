<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Pengguna;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            'no_telephone' => ['required', 'string'],
            'password' => ['required', 'string'],
        ]);

        $pengguna = Pengguna::where('no_telephone', $request->no_telephone)
            ->where('status_akses', 'active')
            ->first();

        if (!$pengguna || !Hash::check($request->password, $pengguna->password)) {
            return response()->json([
                'message' => 'Nomor telepon atau password salah.'
            ], 422);
        }

        $pengguna->tokens()->delete();

        $token = $pengguna->createToken('flutter-user-token')->plainTextToken;

        $pengguna->update([
            'last_login_at' => now(),
        ]);

        return response()->json([
            'message' => 'Login berhasil.',
            'token' => $token,
            'data' => [
                'id' => $pengguna->id,
                'nama_lengkap' => $pengguna->nama_lengkap,
                'no_telephone' => $pengguna->no_telephone,
                'status_akses' => $pengguna->status_akses,
            ]
        ]);
    }

    public function me(Request $request)
    {
        return response()->json([
            'data' => $request->user(),
        ]);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'message' => 'Logout berhasil.'
        ]);
    }
}
