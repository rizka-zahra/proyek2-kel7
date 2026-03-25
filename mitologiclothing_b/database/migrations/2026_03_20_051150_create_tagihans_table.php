<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tagihan', function (Blueprint $table) {
            $table->id();
            $table->foreignId('pesanan_id')->unique()->constrained('pesanan')->cascadeOnDelete();
            $table->string('no_telephone_user');
            $table->text('detail_pesanan');
            $table->unsignedInteger('jumlah_pesanan');
            $table->decimal('harga', 12, 2);
            $table->decimal('total_harga', 12, 2);
            $table->enum('status_pembayaran', [
                'belum_bayar',
                'menunggu_verifikasi',
                'lunas',
            ])->default('belum_bayar');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tagihan');
    }
};
