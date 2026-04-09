<x-app-layout>
    <x-slot name="header">
        Pricelist
    </x-slot>
<link rel="stylesheet" href="{{ asset('css/pricelist/pricelist_kelola.css') }}">

<div class="pricelist-page">
    <div class="pricelist-header">
        <div>
            <h1 class="pricelist-title">Kelola Pricelist</h1>
            <p class="pricelist-subtitle">Atur daftar harga bahan dan produk untuk kebutuhan konveksi</p>
        </div>

        <a href="{{ route('pricelist.tambah') }}" class="btn-tambah-pricelist">
            <span class="plus-icon">+</span>
            Tambah Produk
        </a>
    </div>

    <div class="pricelist-card">
        <div class="pricelist-toolbar">
            <div class="pricelist-search">
                <svg viewBox="0 0 24 24" class="search-icon">
                    <circle cx="11" cy="11" r="7"></circle>
                    <path d="M20 20l-3.5-3.5"></path>
                </svg>
                <input type="text" placeholder="Cari kategori bahan atau harga...">
            </div>

            <div class="pricelist-total">
                <svg viewBox="0 0 24 24" class="total-icon">
                    <path d="M12 4l7 4-7 4-7-4 7-4z"></path>
                    <path d="M5 12l7 4 7-4"></path>
                    <path d="M5 16l7 4 7-4"></path>
                </svg>
                <span>Total Item: {{ $pricelist->count() }}</span>
            </div>
        </div>

        <div class="pricelist-table-wrap">
            <table class="pricelist-table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Kategori Bahan</th>
                        <th>Harga</th>
                        <th>Gambar</th>
                        <th class="th-aksi">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($pricelist as $key => $item)
                        <tr>
                            <td>
                                <div class="pricelist-no">
                                    {{ $key + 1 }}
                                </div>
                            </td>

                            <td>
                                <div class="pricelist-kategori-wrap">
                                    <div class="kategori-title">
                                        {{ $item->kategori->nama_kategori ?? '-' }}
                                    </div>
                                    <div class="kategori-subtext">
                                        Kategori bahan aktif
                                    </div>
                                </div>
                            </td>

                            <td>
                                <div class="pricelist-harga">
                                    Rp {{ number_format($item->harga, 0, ',', '.') }}
                                </div>
                            </td>

                            <td>
                                <div class="pricelist-image-box">
                                    @if($item->gambar)
                                        <img src="{{ asset('storage/' . $item->gambar) }}" alt="Gambar Pricelist">
                                    @else
                                        <div class="image-empty">No Image</div>
                                    @endif
                                </div>
                            </td>

                            <td>
                                <div class="pricelist-actions">
                                    <a href="{{ route('pricelist.edit', $item->id) }}" class="aksi-btn edit-btn" title="Edit">
                                        <svg viewBox="0 0 24 24" class="icon">
                                            <path d="M3 17.25V21h3.75L17.8 9.94l-3.75-3.75L3 17.25Z"></path>
                                            <path d="M14.06 4.94l3.75 3.75"></path>
                                        </svg>
                                    </a>

                                    <form action="{{ route('pricelist.hapus', $item->id) }}" method="POST" class="form-hapus">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="aksi-btn hapus-btn" onclick="return confirm('Yakin hapus?')" title="Hapus">
                                            <svg viewBox="0 0 24 24" class="icon">
                                                <path d="M4 7h16"></path>
                                                <path d="M10 11v6"></path>
                                                <path d="M14 11v6"></path>
                                                <path d="M6 7l1 13h10l1-13"></path>
                                                <path d="M9 7V4h6v3"></path>
                                            </svg>
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="5">
                                <div class="pricelist-empty">
                                    Belum ada data pricelist.
                                </div>
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
</x-app-layout>