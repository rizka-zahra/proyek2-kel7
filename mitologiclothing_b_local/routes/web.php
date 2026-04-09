<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ArtikelController;
use App\Http\Controllers\StokController;
use App\Http\Controllers\TagihanController;
use App\Http\Controllers\ProdukAdminController;
use App\Http\Controllers\DetailProdukAdminController;
use App\Http\Controllers\PesananAdminController;
use App\Http\Controllers\PesananController;
use App\Http\Controllers\PricelistController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\Admin\PenggunaApprovalController;

Route::get('/', function () {
    return view('welcome');
});

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

    Route::get('/stok', [StokController::class, 'kelola'])->name('stok.index');
    Route::get('/stok/tambah', [StokController::class, 'tambah'])->name('stok.tambah');
    Route::post('/stok/simpan', [StokController::class, 'simpan'])->name('stok.simpan');
    Route::get('/stok/edit/{id}', [StokController::class, 'edit'])->name('stok.edit');
    Route::put('/stok/update/{id}', [StokController::class, 'update'])->name('stok.update');
    Route::delete('/stok/hapus/{id}', [StokController::class, 'hapus'])->name('stok.hapus');

    Route::get('/pricelist', [PricelistController::class, 'index'])->name('pricelist.index');
    Route::get('/pricelist/tambah', [PricelistController::class, 'create'])->name('pricelist.tambah');
    Route::post('/pricelist/simpan', [PricelistController::class, 'store'])->name('pricelist.simpan');
    Route::get('/pricelist/edit/{id}', [PricelistController::class, 'edit'])->name('pricelist.edit');
    Route::put('/pricelist/update/{id}', [PricelistController::class, 'update'])->name('pricelist.update');
    Route::delete('/pricelist/hapus/{id}', [PricelistController::class, 'destroy'])->name('pricelist.hapus');

    Route::get('/artikel', [ArtikelController::class, 'kelola'])->name('artikel.index');
    Route::get('/artikel/tambah', [ArtikelController::class, 'tambah'])->name('artikel.tambah');
    Route::post('/artikel/simpan', [ArtikelController::class, 'simpan'])->name('artikel.simpan');
    Route::get('/artikel/edit/{id}', [ArtikelController::class, 'edit'])->name('artikel.edit');
    Route::put('/artikel/update/{id}', [ArtikelController::class, 'update'])->name('artikel.update');
    Route::delete('/artikel/hapus/{id}', [ArtikelController::class, 'hapus'])->name('artikel.hapus');

    Route::prefix('admin')->name('admin.')->group(function () {
        Route::resource('produk', ProdukAdminController::class);

        Route::resource('detail-produk', DetailProdukAdminController::class)->except(['show']);

        Route::resource('pesanan', PesananAdminController::class)->except(['create', 'store']);

        Route::get('tagihan', [TagihanController::class, 'index'])->name('tagihan.index');
        Route::get('tagihan/{tagihan}', [TagihanController::class, 'show'])->name('tagihan.show');
        Route::get('tagihan/{tagihan}/edit', [TagihanController::class, 'edit'])->name('tagihan.edit');
        Route::put('tagihan/{tagihan}', [TagihanController::class, 'update'])->name('tagihan.update');
    });

    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__ . '/auth.php';

Route::middleware(['auth'])->prefix('admin')->name('admin.')->group(function () {
    Route::get('/pengguna', [PenggunaApprovalController::class, 'index'])->name('pengguna.index');
    Route::post('/pengguna/{pengguna}/approve', [PenggunaApprovalController::class, 'approve'])->name('pengguna.approve');
    Route::post('/pengguna/{pengguna}/reject', [PenggunaApprovalController::class, 'reject'])->name('pengguna.reject');
});
