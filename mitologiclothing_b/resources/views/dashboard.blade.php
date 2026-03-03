<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.1.2/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to bottom, #36467A, #000); 
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
            color: white;
        }

        .dashboard-container {
            width: 100%;
            max-width: 1200px;
            overflow-y: auto;
            padding: 20px;
        }

        .sidebar {
            width: 20%;
            background-color: #1a2b50;
            min-height: 100vh;
            color: white;
            padding-top: 20px;
            position: sticky;
            top: 0;
        }

        .sidebar h2 {
            font-size: 1.25rem;
            font-weight: bold;
            padding-left: 20px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li a {
            display: block;
            padding: 15px;
            color: white;
            text-decoration: none;
            font-size: 1rem;
            padding-left: 20px;
            margin-bottom: 10px;
        }

        .sidebar ul li a:hover {
            background-color: #2a3a5b;
            border-radius: 5px;
        }

        .content {
            width: 80%;
            background-color: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            margin-left: 20px;
            color: black;
        }

        .content h1 {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 30px;
            color: #36467A;
        }

        .card {
            background-color: #f0f4f8;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            color: #36467A;
        }

        .card h3 {
            font-size: 1.25rem;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .chart-container {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            margin-top: 30px;
        }

        /* Footer */
        .footer {
            text-align: center;
            padding: 10px;
            background-color: #36467A;
            color: white;
            margin-top: 50px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                padding: 10px;
            }

            .content {
                width: 100%;
                margin-left: 0;
            }
        }
    </style>
</head>

<body>
    <div class="flex dashboard-container">
        <!-- Sidebar -->
        <div class="sidebar">
            <h2>Raja Sawit</h2>
            <ul>
                <li><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li><a href="{{ url('stok') }}">Stok</a></li>
                <li><a href="{{ url('price-list') }}">Price List</a></li>
                <li><a href="{{ url('pesanan') }}">Pesanan</a></li>
                <li><a href="{{ url('tagihan') }}">Tagihan</a></li>
                <li><a href="{{ url('artikel') }}">Artikel</a></li>
                <li><a href="{{ url('logout') }}">Logout</a></li>
            </ul>
        </div>

        <!-- Content -->
        <div class="content">
            <h1>Dashboard</h1>

            {{-- <div class="grid grid-cols-2 gap-4">
                <!-- Total Stok -->
                <div class="card">
                    <h3>Total Stok</h3>
                    <p>{{ $totalProducts }} Produk</p>
                </div> --}}

                {{-- <!-- Total Penjualan -->
                <div class="card">
                    <h3>Total Penjualan</h3>
                    <p>Rp {{ number_format($totalSales, 0, ',', '.') }}</p>
                </div>
            </div> --}}

            {{-- <div class="grid grid-cols-2 gap-4">
                <!-- Pesanan -->
                <div class="card">
                    <h3>Pesanan</h3>
                    <p>{{ $totalOrders }} Pesanan</p>
                </div> --}}

                {{-- <!-- Tagihan -->
                <div class="card">
                    <h3>Tagihan Tertunda</h3>
                    <p>{{ $pendingBills }} Tagihan</p>
                </div>
            </div> --}}

            {{-- <!-- Distribusi Stok -->
            <div class="chart-container">
                <h3>Distribusi Stok</h3>
                <canvas id="stockDistributionChart"></canvas>
            </div> --}}

            {{-- <!-- Grafik Penjualan -->
            <div class="chart-container">
                <h3>Grafik Total Penjualan</h3>
                <canvas id="salesChart"></canvas>
            </div> --}}

        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2026 Raja Sawit. All Rights Reserved.</p>
    </div>

    {{-- <script>
        // Distribusi Stok Chart
        var ctx1 = document.getElementById('stockDistributionChart').getContext('2d');
        var stockDistributionChart = new Chart(ctx1, {
            type: 'pie',
            data: {
                labels: ['Kaos', 'Jaket', 'Ganci', 'Jersey'],
                datasets: [{
                    data: [{{ $stokKaos }}, {{ $stokJaket }}, {{ $stokGanci }}, {{ $stokJersey }}],
                    backgroundColor: ['#1D4ED8', '#F59E0B', '#10B981', '#16A34A'],
                }]
            }
        }); --}}

        {{-- // Grafik Penjualan Chart
        var ctx2 = document.getElementById('salesChart').getContext('2d');
        var salesChart = new Chart(ctx2, {
            type: 'bar',
            data: {
                labels: ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'],
                datasets: [{
                    label: 'Total Penjualan',
                    data: [{{ $penjualanJan }}, {{ $penjualanFeb }}, {{ $penjualanMar }}, {{ $penjualanApr }}],
                    backgroundColor: '#1D4ED8',
                }]
            }
        }); --}}
    </script>
</body>

</html>