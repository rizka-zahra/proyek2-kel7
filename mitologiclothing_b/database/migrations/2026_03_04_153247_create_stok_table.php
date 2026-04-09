<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('stok', function (Blueprint $table) {
            $table->bigIncrements('id_stok');
            $table->foreignId('kategori_bahan_id')
                ->constrained('kategori_bahan')
                ->onDelete('cascade');
            $table->string('detail_bahan');
            $table->integer('stok');
            $table->string('gambar')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('stok');
    }
};
