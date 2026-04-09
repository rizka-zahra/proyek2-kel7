<x-app-layout>
    <x-slot name="header">
        Edit Produk
    </x-slot>

    <form action="{{ route('admin.produk.update', $produk->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')

        <div>
            <label>Nama Produk</label>
            <input type="text" name="nama_produk" value="{{ old('nama_produk', $produk->nama_produk) }}" required>
        </div>

        <div>
            <label>Deskripsi</label>
            <textarea name="deskripsi">{{ old('deskripsi', $produk->deskripsi) }}</textarea>
        </div>

        <div>
            <label>Gambar Saat Ini</label><br>
            @if($produk->gambar)
                <img src="{{ asset('storage/' . $produk->gambar) }}" width="80">
            @else
                Tidak ada gambar
            @endif
        </div>

        <div>
            <label>Ganti Gambar</label>
            <input type="file" name="gambar">
        </div>

        <button type="submit">Update</button>
    </form>
</x-app-layout>
