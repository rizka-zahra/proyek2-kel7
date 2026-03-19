<form action="{{ route('stok.update', $stok->id_stok) }}" method="POST" enctype="multipart/form-data">
    @csrf
    @method('PUT')

    <div>
        <label>Kategori Bahan</label><br>
        <select name="kategori_bahan_id">
            @foreach($kategori as $k)
                <option value="{{ $k->id }}" {{ $stok->kategori_bahan_id == $k->id ? 'selected' : '' }}>
                    {{ $k->nama_kategori }}
                </option>
            @endforeach
        </select>
    </div>

    <div>
        <label>Detail Bahan</label><br>
        <input type="text" name="detail_bahan" value="{{ $stok->detail_bahan }}">
    </div>

    <div>
        <label>Jumlah Stok</label><br>
        <input type="number" name="stok" value="{{ $stok->stok }}">
    </div>

    <div>
        <label>Gambar Baru</label><br>
        <input type="file" name="gambar">
    </div>

    <button type="submit">Update</button>
</form>