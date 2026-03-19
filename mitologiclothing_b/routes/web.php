<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ArtikelController;
use App\Http\Controllers\StokController;
use App\Http\Controllers\TagihanController;
use App\Http\Controllers\PesananController;
use App\Http\Controllers\PricelistController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__ . '/auth.php';

Route::get('/artikel', [ArtikelController::class, 'kelola'])->name('artikel.kelola');
Route::get('/artikel/tambah', [ArtikelController::class, 'tambah'])->name('artikel.tambah');
Route::post('/artikel/simpan', [ArtikelController::class, 'simpan'])->name('artikel.simpan');
Route::get('/artikel/edit/{id}', [ArtikelController::class, 'edit'])->name('artikel.edit');
Route::put('/artikel/update/{id}', [ArtikelController::class, 'update'])->name('artikel.update');
Route::delete('/artikel/hapus/{id}', [ArtikelController::class, 'hapus'])->name('artikel.hapus');

Route::get('/stok', [StokController::class, 'kelola'])->name('stok.kelola');
Route::get('/stok/tambah', [StokController::class, 'tambah'])->name('stok.tambah');
Route::post('/stok/simpan', [StokController::class, 'simpan'])->name('stok.simpan');
Route::get('/stok/edit/{id}', [StokController::class, 'edit'])->name('stok.edit');
Route::put('/stok/update/{id}', [StokController::class, 'update'])->name('stok.update');
Route::delete('/stok/hapus/{id}', [StokController::class, 'hapus'])->name('stok.hapus');

Route::get('/pesanan', [PesananController::class, 'index'])->name('pesanan.kelola');
Route::get('/pesanan/tambah', [PesananController::class, 'create'])->name('pesanan.tambah');
Route::post('/pesanan/simpan', [PesananController::class, 'store'])->name('pesanan.simpan');
Route::get('/pesanan/edit/{id}', [PesananController::class, 'edit'])->name('pesanan.edit');
Route::put('/pesanan/update/{id}', [PesananController::class, 'update'])->name('pesanan.update');
Route::delete('/pesanan/hapus/{id}', [PesananController::class, 'destroy'])->name('pesanan.hapus');

Route::get('/pricelist', [PricelistController::class, 'index'])->name('pricelist.kelola');
Route::get('/pricelist/tambah', [PricelistController::class, 'create'])->name('pricelist.tambah');
Route::post('/pricelist/simpan', [PricelistController::class, 'store'])->name('pricelist.simpan');
Route::get('/pricelist/edit/{id}', [PricelistController::class, 'edit'])->name('pricelist.edit');
Route::put('/pricelist/update/{id}', [PricelistController::class, 'update'])->name('pricelist.update');
Route::delete('/pricelist/hapus/{id}', [PricelistController::class, 'destroy'])->name('pricelist.hapus');

Route::get('/tagihan', [TagihanController::class, 'index'])->name('tagihan.kelola');
Route::get('/tagihan/tambah', [TagihanController::class, 'create'])->name('tagihan.tambah');
Route::post('/tagihan/simpan', [TagihanController::class, 'store'])->name('tagihan.simpan');
Route::get('/tagihan/edit/{id}', [TagihanController::class, 'edit'])->name('tagihan.edit');
Route::put('/tagihan/update/{id}', [TagihanController::class, 'update'])->name('tagihan.update');
Route::delete('/tagihan/hapus/{id}', [TagihanController::class, 'destroy'])->name('tagihan.hapus');
