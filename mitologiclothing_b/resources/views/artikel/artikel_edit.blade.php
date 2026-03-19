@extends('layouts.app')

@section('content')
<div style="padding:40px;">
    <h2>Edit Artikel</h2>

    <form action="{{ route('artikel.update',$artikel->id) }}" 
          method="POST" 
          enctype="multipart/form-data">
        @csrf
        @method('PUT')

        <div>
            <label>Kategori</label><br>
            <select name="kategori_id">
                @foreach($kategori as $k)
                    <option value="{{ $k->id }}"
                        {{ $artikel->kategori_id == $k->id ? 'selected' : '' }}>
                        {{ $k->nama_kategori }}
                    </option>
                @endforeach
            </select>
        </div>

        <br>

        <div>
            <label>Judul</label><br>
            <input type="text" name="judul" value="{{ $artikel->judul }}">
        </div>

        <br>

        <div>
            <label>Isi</label><br>
            <textarea name="isi" rows="5">{{ $artikel->isi }}</textarea>
        </div>

        <br>

        <div>
            <label>Tanggal Publish</label><br>
            <input type="date"
                   name="tanggal_publish"
                   value="{{ $artikel->tanggal_publish }}">
        </div>

        <br>

        <div>
            <label>Gambar</label><br>

            @if($artikel->gambar)
                <img src="{{ asset('storage/artikel/'.$artikel->gambar) }}" 
                     width="100"><br><br>
            @endif

            <input type="file" name="gambar">
        </div>

        <br>

        <button type="submit">Update</button>
        <a href="{{ route('artikel.kelola') }}">Kembali</a>
    </form>
</div>
@endsection