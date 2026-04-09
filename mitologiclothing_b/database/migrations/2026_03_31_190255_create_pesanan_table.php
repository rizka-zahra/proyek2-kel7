<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('pesanan', function (Blueprint $table) {
            $table->id();
            $table->foreignId('pengguna_id')->constrained('pengguna')->cascadeOnDelete();
            $table->string('nama_pemesan');
            $table->string('no_telephone');
            $table->text('alamat_pengguna');
            $table->string('pengiriman');
            $table->decimal('subtotal_pembayaran', 12, 2);
            $table->decimal('subtotal_pengiriman', 12, 2)->default(0);
            $table->decimal('total_pembayaran', 12, 2);
            $table->string('metode_pembayaran');
            $table->enum('status_order', [
                'menunggu',
                'diproses',
                'dikirim',
                'selesai',
                'dibatalkan',
            ])->default('menunggu');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('pesanan');
    }
};
