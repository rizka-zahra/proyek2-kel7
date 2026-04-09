<x-app-layout>
    <x-slot name="header">
        Detail Produk
    </x-slot>

    <div>
        <h3>{{ $produk->nama_produk }}</h3>
        <p>{{ $produk->deskripsi }}</p>

        @if($produk->gambar)
            <img src="{{ asset('storage/' . $produk->gambar) }}" width="100">
        @endif
    </div>

    <hr>

    <h4>Detail Produk</h4>

    @forelse($produk->detailProduk as $detail)
        <div style="border:1px solid #ccc; padding:10px; margin-bottom:10px;">
            <p><b>Bahan:</b> {{ $detail->bahan }}</p>
            <p><b>Warna:</b> {{ $detail->warna }}</p>
            <p><b>Ukuran:</b> {{ $detail->ukuran }}</p>
            <p><b>Harga:</b> Rp {{ number_format($detail->harga) }}</p>

            <a href="{{ route('admin.detail-produk.edit', $detail->id) }}">Edit</a>
        </div>
    @empty
        <p>Belum ada detail produk</p>
    @endforelse

</x-app-layout>
