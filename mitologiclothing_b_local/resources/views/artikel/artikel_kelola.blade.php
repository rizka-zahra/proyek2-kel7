<x-app-layout>
    <x-slot name="header">
        Artikel
    </x-slot>

    <link rel="stylesheet" href="{{ asset('css/artikel/artikel_kelola.css') }}">

    <div class="artikel-page">
        <div class="artikel-header">
            <div>
                <h1 class="artikel-title">Manajemen Artikel</h1>
                <p class="artikel-subtitle">Buat dan kelola konten edukasi konveksi Anda</p>
            </div>

            <a href="{{ route('artikel.tambah') }}" class="btn-tambah-artikel">
                + Tulis Artikel Baru
            </a>
        </div>

        <div class="artikel-search-box">
            <input type="text" placeholder="Cari judul atau kategori..." class="artikel-search-input">
        </div>

        <div class="artikel-list">
            @forelse($artikel as $item)
                <div class="artikel-card">
                    <div class="artikel-card-content">
                        <div class="artikel-badges">
                            <span class="badge badge-kategori">
                                {{ strtoupper($item->kategori->nama_kategori ?? 'TANPA KATEGORI') }}
                            </span>
                            <span class="badge badge-status">PUBLISHED</span>
                        </div>

                        <h2 class="artikel-card-title">{{ $item->judul }}</h2>

                        <p class="artikel-card-desc">
                            {{ \Illuminate\Support\Str::limit(strip_tags($item->isi), 100, '...') }}
                        </p>

                        <div class="artikel-card-footer">
                            <div class="artikel-meta">
                                <span>{{ $item->penulis ?? 'Admin' }}</span>
                                <span>{{ $item->tanggal_publish ?? '-' }}</span>
                            </div>

                            <div class="artikel-actions">
                                <a href="{{ route('artikel.edit', $item->id) }}" class="aksi-btn edit-btn" title="Edit">
                                    <svg viewBox="0 0 24 24" class="icon">
                                        <path d="M3 17.25V21h3.75L17.8 9.94l-3.75-3.75L3 17.25Z" />
                                        <path d="M14.06 4.94l3.75 3.75" />
                                    </svg>
                                </a>

                                <form action="{{ route('artikel.hapus', $item->id) }}" method="POST" class="form-hapus">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="aksi-btn hapus-btn" onclick="return confirm('Yakin hapus?')" title="Hapus">
                                        <svg viewBox="0 0 24 24" class="icon">
                                            <path d="M4 7h16" />
                                            <path d="M10 11v6" />
                                            <path d="M14 11v6" />
                                            <path d="M6 7l1 13h10l1-13" />
                                            <path d="M9 7V4h6v3" />
                                        </svg>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="artikel-card-image">
                        @if($item->gambar)
                            <img src="{{ asset('storage/' . $item->gambar) }}" alt="{{ $item->judul }}">
                        @else
                            <div class="gambar-kosong">Tidak ada gambar</div>
                        @endif
                    </div>
                </div>
            @empty
                <div class="artikel-kosong">
                    Belum ada artikel.
                </div>
            @endforelse
        </div>
    </div>
</x-app-layout>