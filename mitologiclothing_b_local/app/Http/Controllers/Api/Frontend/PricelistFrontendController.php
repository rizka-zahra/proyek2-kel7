<?php

namespace App\Http\Controllers\Api\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Pricelists;

class PricelistFrontendController extends Controller
{
    public function index()
    {
        $pricelist = Pricelists::with('kategori')->latest()->get()->map(function ($item) {
            $item->gambar_url = $item->gambar
                ? asset('storage/' . $item->gambar)
                : null;
            return $item;
        });

        return response()->json([
            'success' => true,
            'message' => 'Daftar pricelist berhasil diambil',
            'data' => $pricelist
        ], 200);
    }

    public function show($id)
    {
        $pricelist = Pricelists::with('kategori')->findOrFail($id);
        $pricelist->gambar_url = $pricelist->gambar
            ? asset('storage/' . $pricelist->gambar)
            : null;

        return response()->json([
            'success' => true,
            'message' => 'Detail pricelist berhasil diambil',
            'data' => $pricelist
        ], 200);
    }
}
