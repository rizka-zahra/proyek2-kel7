<x-app-layout>
    <x-slot name="header">
        Detail Tagihan #{{ $tagihan->id }}
    </x-slot>

    <p><strong>Pesanan ID:</strong> {{ $tagihan->pesanan_id }}</p>
    <p><strong>Nama Pemesan:</strong> {{ $tagihan->nama_pemesan }}</p>
    <p><strong>No Telepon:</strong> {{ $tagihan->no_telephone_user }}</p>
    <p><strong>Detail Pesanan:</strong> {{ $tagihan->detail_pesanan }}</p>
    <p><strong>Jumlah Pesanan:</strong> {{ $tagihan->jumlah_pesanan }}</p>
    <p><strong>Harga:</strong> Rp {{ number_format($tagihan->harga, 0, ',', '.') }}</p>
    <p><strong>Total Harga:</strong> Rp {{ number_format($tagihan->total_harga, 0, ',', '.') }}</p>
    <p><strong>Status Pembayaran:</strong> {{ ucfirst(str_replace('_', ' ', $tagihan->status_pembayaran)) }}</p>
</x-app-layout>