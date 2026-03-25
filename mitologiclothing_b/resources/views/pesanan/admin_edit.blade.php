@extends('layouts.app')

@section('content')
<link rel="stylesheet" href="{{ asset('css/pesanan/pesanan_edit.css') }}">

<div class="pesanan-form-page">
    <div class="pesanan-form-header">
        <a href="{{ route('admin.pesanan.index') }}" class="back-btn" aria-label="Kembali">
            <svg viewBox="0 0 24 24" class="back-icon">
                <path d="M15 18l-6-6 6-6" />
            </svg>
        </a>

        <div>
            <h1 class="form-title">Edit Status Pesanan</h1>
            <p class="form-subtitle">Perbarui status proses pesanan pelanggan</p>
        </div>
    </div>

    <div class="pesanan-form-card">
        <form action="{{ route('admin.pesanan.update', $pesanan->id) }}" method="POST">
            @csrf
            @method('PUT')

            <div class="form-group">
                <label for="status_order">Status Pesanan <span>*</span></label>
                <select name="status_order" id="status_order" class="form-control" required>
                    <option value="menunggu" {{ $pesanan->status_order == 'menunggu' ? 'selected' : '' }}>Menunggu</option>
                    <option value="diproses" {{ $pesanan->status_order == 'diproses' ? 'selected' : '' }}>Diproses</option>
                    <option value="dikirim" {{ $pesanan->status_order == 'dikirim' ? 'selected' : '' }}>Dikirim</option>
                    <option value="selesai" {{ $pesanan->status_order == 'selesai' ? 'selected' : '' }}>Selesai</option>
                    <option value="dibatalkan" {{ $pesanan->status_order == 'dibatalkan' ? 'selected' : '' }}>Dibatalkan</option>
                </select>
            </div>

            <div class="status-preview">
                <span class="status-label">Status saat ini:</span>
                <span class="status-badge status-{{ $pesanan->status_order }}">
                    {{ ucfirst($pesanan->status_order) }}
                </span>
            </div>

            <div class="form-actions">
                <a href="{{ route('admin.pesanan.index') }}" class="btn-cancel">Kembali</a>
                <button type="submit" class="btn-submit">
                    <svg viewBox="0 0 24 24" class="save-icon">
                        <path d="M5 21h14a2 2 0 0 0 2-2V7.5L16.5 3H5a2 2 0 0 0-2 2V19a2 2 0 0 0 2 2Z" />
                        <path d="M17 21v-8H7v8" />
                        <path d="M7 3v5h8" />
                    </svg>
                    Simpan Perubahan
                </button>
            </div>
        </form>
    </div>
</div>
@endsection