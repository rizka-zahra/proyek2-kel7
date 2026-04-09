<?php

namespace App\Http\Controllers;

use App\Models\Stok;
use App\Models\Pesanan;
use App\Models\Tagihan;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        // Card summary
        $totalProducts = Stok::count();
        $totalOrders = Pesanan::count();
        $totalSales = Pesanan::whereIn('status_order', ['diproses', 'dikirim', 'selesai'])
            ->sum('total_pembayaran');
        $pendingBills = Tagihan::whereIn('status_pembayaran', ['belum_bayar', 'menunggu_verifikasi'])->count();

        // Distribusi stok per kategori bahan
        $stockDistribution = Stok::select('kategori_bahan_id', DB::raw('SUM(stok) as total_stok'))
            ->with('kategori:id,nama_kategori')
            ->groupBy('kategori_bahan_id')
            ->get();

        $stockLabels = $stockDistribution->map(function ($item) {
            return $item->kategori->nama_kategori ?? 'Tanpa Kategori';
        })->values();

        $stockData = $stockDistribution->pluck('total_stok')->values();

        // Grafik total penjualan per bulan tahun berjalan
        $salesPerMonth = Pesanan::selectRaw('EXTRACT(MONTH FROM created_at) as bulan, SUM(total_pembayaran) as total')
            ->whereYear('created_at', now()->year)
            ->whereIn('status_order', ['diproses', 'dikirim', 'selesai'])
            ->groupByRaw('EXTRACT(MONTH FROM created_at)')
            ->orderByRaw('EXTRACT(MONTH FROM created_at)')
            ->get();

        $bulanLengkap = [
            1 => 'Januari',
            2 => 'Februari',
            3 => 'Maret',
            4 => 'April',
            5 => 'Mei',
            6 => 'Juni',
            7 => 'Juli',
            8 => 'Agustus',
            9 => 'September',
            10 => 'Oktober',
            11 => 'November',
            12 => 'Desember',
        ];

        $salesLabels = array_values($bulanLengkap);
        $salesData = [];

        for ($i = 1; $i <= 12; $i++) {
            $found = $salesPerMonth->firstWhere('bulan', $i);
            $salesData[] = $found ? (int) $found->total : 0;
        }

        return view('dashboard', compact(
            'totalProducts',
            'totalOrders',
            'totalSales',
            'pendingBills',
            'stockLabels',
            'stockData',
            'salesLabels',
            'salesData'
        ));
    }
}
