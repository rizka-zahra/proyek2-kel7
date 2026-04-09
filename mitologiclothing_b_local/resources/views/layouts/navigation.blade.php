<aside class="admin-sidebar">
    <div class="sidebar-user">
        <div class="sidebar-avatar">
            {{ strtoupper(substr(Auth::user()->name ?? 'U', 0, 1)) }}
        </div>

        <div class="sidebar-user-info">
            <div class="sidebar-name">{{ Auth::user()->name }}</div>
            <div class="sidebar-role">{{ Auth::user()->role ?? 'Admin' }}</div>
        </div>
    </div>

    <nav class="sidebar-nav">
        <a href="{{ route('dashboard') }}" class="sidebar-link {{ request()->routeIs('dashboard') ? 'active' : '' }}">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                <rect x="3" y="3" width="7" height="7" rx="1.5"></rect>
                <rect x="14" y="3" width="7" height="7" rx="1.5"></rect>
                <rect x="3" y="14" width="7" height="7" rx="1.5"></rect>
                <rect x="14" y="14" width="7" height="7" rx="1.5"></rect>
            </svg>
            <span>Dashboard</span>
        </a>

        <a href="{{ route('admin.produk.index') }}" class="sidebar-link {{ request()->routeIs('admin.produk.*') ? 'active' : '' }}">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                <rect x="3" y="4" width="18" height="16" rx="2"></rect>
                <path d="M7 8h10"></path>
                <path d="M7 12h10"></path>
                <path d="M7 16h6"></path>
            </svg>
            <span>Produk</span>
        </a>

        <a href="{{ route('admin.detail-produk.index') }}" class="sidebar-link {{ request()->routeIs('admin.detail-produk.*') ? 'active' : '' }}">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                <path d="M4 6h16"></path>
                <path d="M4 12h16"></path>
                <path d="M4 18h16"></path>
            </svg>
            <span>Detail Produk</span>
        </a>

        <a href="{{ route('admin.pesanan.index') }}" class="sidebar-link {{ request()->routeIs('admin.pesanan.*') ? 'active' : '' }}">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                <circle cx="9" cy="20" r="1.5"></circle>
                <circle cx="18" cy="20" r="1.5"></circle>
                <path d="M3 4h2l2.2 10.2a1 1 0 0 0 1 .8h8.9a1 1 0 0 0 1-.8L20 8H7"></path>
            </svg>
            <span>Pesanan</span>
        </a>

        <a href="{{ route('admin.tagihan.index') }}" class="sidebar-link {{ request()->routeIs('tagihan.*') ? 'active' : '' }}">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                <path d="M8 3h8l3 3v15H5V3h3"></path>
                <path d="M8 7h8"></path>
                <path d="M8 11h8"></path>
                <path d="M8 15h5"></path>
            </svg>
            <span>Tagihan</span>
        </a>

        <a href="{{ route('pricelist.index') }}" class="sidebar-link {{ request()->routeIs('pricelist.*') ? 'active' : '' }}">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                <path d="M8 6h13"></path>
                <path d="M8 12h13"></path>
                <path d="M8 18h13"></path>
                <path d="M3 6h.01"></path>
                <path d="M3 12h.01"></path>
                <path d="M3 18h.01"></path>
            </svg>
            <span>Price List</span>
        </a>

        <a href="{{ route('stok.index') }}" class="sidebar-link {{ request()->routeIs('stok.*') ? 'active' : '' }}">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                <path d="M12 3 4 7l8 4 8-4-8-4Z"></path>
                <path d="M4 7v10l8 4 8-4V7"></path>
                <path d="M12 11v10"></path>
            </svg>
            <span>Stok</span>
        </a>

        <a href="{{ route('artikel.index') }}" class="sidebar-link {{ request()->routeIs('artikel.*') ? 'active' : '' }}">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                <rect x="3" y="4" width="18" height="16" rx="2"></rect>
                <path d="M7 8h10"></path>
                <path d="M7 12h10"></path>
                <path d="M7 16h6"></path>
            </svg>
            <span>Artikel</span>
        </a>
    </nav>

    <div class="sidebar-logout">
        <form method="POST" action="{{ route('logout') }}">
            @csrf
            <button type="submit" class="logout-btn">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                    <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                    <path d="M16 17l5-5-5-5"></path>
                    <path d="M21 12H9"></path>
                </svg>
                <span>Logout</span>
            </button>
        </form>
    </div>
</aside>
