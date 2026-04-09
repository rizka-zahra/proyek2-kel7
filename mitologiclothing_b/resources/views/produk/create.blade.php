<x-app-layout>
    <x-slot name="header">
        Tambah Produk
    </x-slot>

    <form action="{{ route('admin.produk.store') }}" method="POST" enctype="multipart/form-data">
        @csrf

        <div>
            <label>Nama Produk</label><br>
            <input type="text" name="nama_produk" required>
        </div>

        <div>
            <label>Gambar</label><br>
            <input type="file" name="gambar">
        </div>

        <div>
            <label>Deskripsi</label><br>
            <textarea name="deskripsi"></textarea>
        </div>

        <br>
        <button type="submit">Simpan</button>
    </form>
</x-app-layout>
