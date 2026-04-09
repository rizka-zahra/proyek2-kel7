<?php

namespace App\Http\Controllers\Api\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Artikel;

class ArtikelFrontendController extends Controller
{
    public function index()
    {
        $artikel = Artikel::with('kategori')->latest()->get()->map(function ($item) {
            $item->gambar_url = $item->gambar
                ? asset('storage/' . $item->gambar)
                : null;
            return $item;
        });

        return response()->json([
            'success' => true,
            'message' => 'Daftar artikel berhasil diambil',
            'data' => $artikel
        ], 200);
    }

    public function show($id)
    {
        $artikel = Artikel::with('kategori')->findOrFail($id);
        $artikel->gambar_url = $artikel->gambar
            ? asset('storage/' . $artikel->gambar)
            : null;

        return response()->json([
            'success' => true,
            'message' => 'Detail artikel berhasil diambil',
            'data' => $artikel
        ], 200);
    }
}
