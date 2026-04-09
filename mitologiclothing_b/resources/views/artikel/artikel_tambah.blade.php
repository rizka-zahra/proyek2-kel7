<x-app-layout>
    <x-slot name="header">
        Artikel
    </x-slot>
    <link rel="stylesheet" href="{{ asset('css/artikel/artikel_tambah.css') }}">

    <div>
        <h2>Tambah Artikel</h2>

        <form action="{{ route('artikel.simpan') }}" method="POST" enctype="multipart/form-data">
            @csrf

            <div>
                <label>Kategori</label><br>
                <select name="kategori_id">
                    @foreach($kategori as $k)
                        <option value="{{ $k->id }}">{{ $k->nama_kategori }}</option>
                    @endforeach
                </select>
            </div>

            <br>

            <div>
                <label>Judul</label><br>
                <input type="text" name="judul">
            </div>

            <br>

            <div>
                <label>Isi</label><br>
                <textarea name="isi" rows="5"></textarea>
            </div>

            <br>

            <div>
                <label>Tanggal Publish</label><br>
                <input type="date" name="tanggal_publish">
            </div>

            <br>

            <div>
                <label>Gambar</label><br>
                <input type="file" name="gambar">
            </div>

            <br>

            <button type="submit">Simpan</button>
            <a href="{{ route('artikel.index') }}">Kembali</a>
        </form>
    </div>
</x-app-layout>