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
        Schema::create('pesanan', function (Blueprint $table) {
            $table->id();
            $table->string('no_telephone');
            $table->text('desain');
            $table->string('ukuran');
            $table->string('warna');
            $table->string('bahan');
            $table->integer('jumlah');
            $table->text('alamat_pengguna');
            $table->string('pengiriman');
            $table->decimal('subtotal_pembayaran', 10, 2);
            $table->decimal('subtotal_pengiriman', 10, 2);
            $table->decimal('total_pembayaran', 10, 2);
            $table->string('metode_pembayaran');
            $table->string('status_order');
            $table->foreignId('pricelists_id')->constrained()->onDelete('cascade');
            $table->timestamps();
        });
    }
    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pesanan');
    }
};
