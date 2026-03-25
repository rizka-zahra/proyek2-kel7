@extends('layouts.app')

@section('content')
<link rel="stylesheet" href="{{ asset('css/tagihan/tagihan_kelola.css') }}">

<div class="invoice-page">
    <div class="invoice-box">
        <div class="invoice-header">
            <div>
                <h2>Tagihan Pesanan</h2>
                <p><strong>No Invoice:</strong> INV-{{ str_pad($tagihan->id, 5, '0', STR_PAD_LEFT) }}</p>
                <p><strong>Tanggal:</strong> {{ $tagihan->created_at ? $tagihan->created_at->format('d-m-Y') : '-' }}</p>
            </div>

            <div>
                <span class="status {{ $tagihan->status_pembayaran }}">
                    {{ str_replace('_', ' ', $tagihan->status_pembayaran) }}
                </span>
            </div>
        </div>

        <div class="section-title">Data Pembeli</div>
        <table class="info-table">
            <tr>
                <td width="220"><strong>No Telepon</strong></td>
                <td>: {{ $tagihan->no_telephone_user }}</td>
            </tr>
            <tr>
                <td><strong>Alamat Pengguna</strong></td>
                <td>: {{ $tagihan->pesanan->alamat_pengguna ?? '-' }}</td>
            </tr>
            <tr>
                <td><strong>Pengiriman</strong></td>
                <td>: {{ $tagihan->pesanan->pengiriman ?? '-' }}</td>
            </tr>
            <tr>
                <td><strong>Metode Pembayaran</strong></td>
                <td>: {{ $tagihan->pesanan->metode_pembayaran ?? '-' }}</td>
            </tr>
            <tr>
                <td><strong>Status Order</strong></td>
                <td>: {{ $tagihan->pesanan->status_order ?? '-' }}</td>
            </tr>
        </table>

        <div class="section-title">Rincian Pesanan</div>
        <table class="item-table">
            <thead>
                <tr>
                    <th>Detail Pesanan</th>
                    <th>Jumlah</th>
                    <th>Harga Satuan</th>
                    <th>Total Harga</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>{{ $tagihan->detail_pesanan }}</td>
                    <td>{{ $tagihan->jumlah_pesanan }}</td>
                    <td>Rp {{ number_format($tagihan->harga, 0, ',', '.') }}</td>
                    <td>Rp {{ number_format($tagihan->total_harga, 0, ',', '.') }}</td>
                </tr>
            </tbody>
        </table>

        <table class="total-table">
            <tr>
                <td class="text-right"><strong>Total Bayar</strong></td>
                <td width="220" class="text-right grand-total">
                    Rp {{ number_format($tagihan->total_harga, 0, ',', '.') }}
                </td>
            </tr>
        </table>

        <div class="btn-group">
            <a href="javascript:window.print()" class="btn btn-print">Cetak</a>
            <a href="{{ route('admin.tagihan.index') }}" class="btn btn-back">Kembali</a>
        </div>
    </div>
</div>
@endsection