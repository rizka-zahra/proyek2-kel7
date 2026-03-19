<form action="{{ route('stok.simpan') }}" method="POST" enctype="multipart/form-data">
    @csrf
    <div>
        <label>Kategori Bahan</label><br>
        <select name="kategori_bahan_id">
            @foreach($kategori as $k)
                <option value="{{ $k->id }}">{{ $k->nama_kategori }}</option>
            @endforeach
        </select>
    </div>

    <div>
        <label>Detail Bahan</label><br>
        <input type="text" name="detail_bahan">
    </div>

    <div>
        <label>Jumlah Stok</label><br>
        <input type="number" name="stok">
    </div>

    <div>
        <label>Gambar</label><br>
        <input type="file" name="gambar">
    </div>

    <button type="submit">Simpan</button>
</form>