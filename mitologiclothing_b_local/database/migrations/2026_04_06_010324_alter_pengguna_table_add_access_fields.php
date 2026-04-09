<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('pengguna', function (Blueprint $table) {
            $table->string('nama_lengkap')->nullable()->after('id');
            $table->text('keterangan')->nullable()->after('no_telephone');
            $table->enum('status_akses', ['pending', 'approved', 'active', 'rejected'])
                ->default('pending')
                ->after('keterangan');
            $table->string('activation_token', 100)->nullable()->after('status_akses');
            $table->timestamp('activation_token_expired_at')->nullable()->after('activation_token');
            $table->string('password')->nullable()->after('activation_token_expired_at');
            $table->timestamp('approved_at')->nullable()->after('password');
            $table->timestamp('last_login_at')->nullable()->after('approved_at');
        });
    }

    public function down(): void
    {
        Schema::table('pengguna', function (Blueprint $table) {
            $table->dropColumn([
                'nama_lengkap',
                'keterangan',
                'status_akses',
                'activation_token',
                'activation_token_expired_at',
                'password',
                'approved_at',
                'last_login_at',
            ]);
        });
    }
};
