<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Pengguna;
use Illuminate\Support\Str;

class PenggunaApprovalController extends Controller
{
    public function index()
    {
        $penggunas = Pengguna::latest()->get();
        return view('admin.pengguna.index', compact('penggunas'));
    }

    public function approve(Pengguna $pengguna)
    {
        $token = Str::random(64);

        $pengguna->update([
            'status_akses' => 'approved',
            'activation_token' => $token,
            'activation_token_expired_at' => now()->addDay(),
            'approved_at' => now(),
        ]);

        $activationUrl = env('FLUTTER_ACTIVATION_URL') . '?token=' . $token;

        $waLink = 'https://wa.me/' . $this->normalizePhone($pengguna->no_telephone)
            . '?text=' . rawurlencode(
                "Halo {$pengguna->nama_lengkap}, akses Anda telah disetujui.\n\n" .
                    "Silakan klik link berikut untuk aktivasi akun:\n{$activationUrl}"
            );

        return redirect()->route('admin.pengguna.index')
            ->with('success', 'Pengguna berhasil di-approve.')
            ->with('activation_url', $activationUrl)
            ->with('wa_link', $waLink);
    }

    public function reject(Pengguna $pengguna)
    {
        $pengguna->update([
            'status_akses' => 'rejected',
            'activation_token' => null,
            'activation_token_expired_at' => null,
        ]);

        return redirect()->route('admin.pengguna.index')
            ->with('success', 'Permintaan akses ditolak.');
    }

    private function normalizePhone(string $phone): string
    {
        $phone = preg_replace('/\D/', '', $phone);

        if (str_starts_with($phone, '0')) {
            return '62' . substr($phone, 1);
        }

        if (!str_starts_with($phone, '62')) {
            return '62' . $phone;
        }

        return $phone;
    }
}
