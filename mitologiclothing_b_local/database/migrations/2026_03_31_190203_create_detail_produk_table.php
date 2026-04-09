<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('detail_produk', function (Blueprint $table) {
            $table->id();
            $table->foreignId('produk_id')->constrained('produk')->cascadeOnDelete();
            $table->string('bahan');
            $table->string('warna');
            $table->string('ukuran');
            $table->decimal('harga', 12, 2);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('detail_produk');
    }
};
