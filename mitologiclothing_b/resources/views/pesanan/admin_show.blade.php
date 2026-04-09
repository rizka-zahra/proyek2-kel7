<x-app-layout>
    <x-slot name="header">
        Detail Pesanan
    </x-slot>

    <a href="{{ route('admin.pesanan.index') }}">← Kembali</a>
    <br><br>

    <h3>Informasi Pemesan</h3>
    <p><strong>Nama:</strong> {{ $pesanan->nama_pemesan }}</p>
    <p><strong>No HP:</strong> {{ $pesanan->no_telephone }}</p>
    <p><strong>Alamat:</strong> {{ $pesanan->alamat_pengguna }}</p>

    <hr>

    <h3>Informasi Pesanan</h3>
    <p><strong>Status:</strong> {{ ucfirst($pesanan->status_order) }}</p>
    <p><strong>Pengiriman:</strong> {{ $pesanan->pengiriman }}</p>
    <p><strong>Subtotal Produk:</strong> Rp {{ number_format($pesanan->subtotal_pembayaran, 0, ',', '.') }}</p>
    <p><strong>Ongkir:</strong> Rp {{ number_format($pesanan->subtotal_pengiriman, 0, ',', '.') }}</p>
    <p><strong>Total:</strong> Rp {{ number_format($pesanan->total_pembayaran, 0, ',', '.') }}</p>
    <p><strong>Metode Pembayaran:</strong> {{ $pesanan->metode_pembayaran }}</p>

    <hr>

    <h3>Item Pesanan</h3>

    @foreach($pesanan->items as $item)
        <p><strong>Produk:</strong> {{ $item->detailProduk->produk->nama_produk }}</p>
        <p><strong>Bahan:</strong> {{ $item->detailProduk->bahan }}</p>
        <p><strong>Warna:</strong> {{ $item->detailProduk->warna }}</p>
        <p><strong>Ukuran:</strong> {{ $item->detailProduk->ukuran }}</p>
        <p><strong>Jumlah:</strong> {{ $item->jumlah }}</p>
        <p><strong>Harga:</strong> Rp {{ number_format($item->harga, 0, ',', '.') }}</p>
        <p><strong>Subtotal:</strong> Rp {{ number_format($item->subtotal, 0, ',', '.') }}</p>

        @if($item->desain)
            <p><strong>Desain:</strong></p>
            <img src="{{ asset('storage/' . $item->desain) }}" width="150">
        @endif

        <hr>
    @endforeach


</x-app-layout>
