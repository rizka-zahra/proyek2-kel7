<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Frontend\ArtikelFrontendController;
use App\Http\Controllers\Api\Frontend\PricelistFrontendController;
use App\Http\Controllers\Api\Frontend\StokFrontendController;
use App\Http\Controllers\Api\Frontend\PesananFrontendController;
use App\Http\Controllers\Api\AccessRequestController;
use App\Http\Controllers\Api\ActivationController;
use App\Http\Controllers\Api\AuthController;

Route::post('/access/request', [AccessRequestController::class, 'store']);
Route::post('/access/check-token', [ActivationController::class, 'checkToken']);
Route::post('/access/set-password', [ActivationController::class, 'setPassword']);

Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/me', [AuthController::class, 'me']);
    Route::post('/logout', [AuthController::class, 'logout']);
});

Route::prefix('frontend')->group(function () {
    Route::get('/artikel', [ArtikelFrontendController::class, 'index']);
    Route::get('/artikel/{id}', [ArtikelFrontendController::class, 'show']);

    Route::get('/pricelist', [PricelistFrontendController::class, 'index']);
    Route::get('/pricelist/{id}', [PricelistFrontendController::class, 'show']);

    Route::get('/stok', [StokFrontendController::class, 'index']);
    Route::get('/stok/{id}', [StokFrontendController::class, 'show']);

    Route::post('/pesanan', [PesananFrontendController::class, 'store']);
    Route::get('/pesanan/{id}', [PesananFrontendController::class, 'show']);
});
