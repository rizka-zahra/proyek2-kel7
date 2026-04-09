<?php

namespace App\Http\Controllers\Api\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Stok;

class StokFrontendController extends Controller
{
    public function index()
    {
        $stok = Stok::latest()->get()->map(function ($item) {
            $item->gambar_url = $item->gambar
                ? asset('storage/' . $item->gambar)
                : null;
            return $item;
        });

        return response()->json([
            'success' => true,
            'message' => 'Data stok berhasil diambil',
            'data' => $stok
        ], 200);
    }

    public function show($id)
    {
        $stok = Stok::findOrFail($id);
        $stok->gambar_url = $stok->gambar
            ? asset('storage/' . $stok->gambar)
            : null;

        return response()->json([
            'success' => true,
            'message' => 'Detail stok berhasil diambil',
            'data' => $stok
        ], 200);
    }
}
