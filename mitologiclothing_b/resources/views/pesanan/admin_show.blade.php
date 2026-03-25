<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Detail Pesanan</title>
</head>
<body>
    <h1>Detail Pesanan</h1>

    <p><strong>No Telephone:</strong> {{ $pesanan->pembeli->no_telephone ?? '-' }}</p>
    <p><strong>Desain:</strong> {{ $pesanan->desain }}</p>
    <p><strong>Ukuran:</strong> {{ $pesanan->ukuran }}</p>
    <p><strong>Warna:</strong> {{ $pesanan->warna }}</p>
    <p><strong>Bahan:</strong> {{ $pesanan->bahan }}</p>
    <p><strong>Jumlah:</strong> {{ $pesanan->jumlah }}</p>
    <p><strong>Alamat:</strong> {{ $pesanan->alamat_pengguna }}</p>
    <p><strong>Pengiriman:</strong> {{ $pesanan->pengiriman }}</p>
    <p><strong>Total Pembayaran:</strong> Rp {{ number_format($pesanan->total_pembayaran, 0, ',', '.') }}</p>
    <p><strong>Metode Pembayaran:</strong> {{ $pesanan->metode_pembayaran }}</p>
    <p><strong>Status:</strong> {{ ucfirst($pesanan->status_order) }}</p>

    @if($pesanan->tagihan)
        <h3>Tagihan</h3>
        <p><strong>No Telephone User:</strong> {{ $pesanan->tagihan->no_telephone_user }}</p>
        <p><strong>Detail Pesanan:</strong> {{ $pesanan->tagihan->detail_pesanan }}</p>
        <p><strong>Jumlah Pesanan:</strong> {{ $pesanan->tagihan->jumlah_pesanan }}</p>
        <p><strong>Harga:</strong> Rp {{ number_format($pesanan->tagihan->harga, 0, ',', '.') }}</p>
        <p><strong>Total Harga:</strong> Rp {{ number_format($pesanan->tagihan->total_harga, 0, ',', '.') }}</p>
    @endif

    <a href="{{ route('admin.pesanan.index') }}">Kembali</a>
</body>
</html>