<x-app-layout>
    <x-slot name="header">
        Dashboard
    </x-slot>

    <link rel="stylesheet" href="{{ asset('css/dashboard.css') }}">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <div class="dashboard-page">
        <div class="dashboard-header">
            <h1>Dashboard</h1>
            <p>Ringkasan performa konveksi, stok, penjualan, dan tagihan</p>
        </div>

        <div class="stats-grid">
            <div class="stat-card stat-blue">
                <div class="stat-top">
                    <span>Total Stok</span>
                    <span class="stat-icon-wrap">
                        <svg viewBox="0 0 24 24" class="stat-icon">
                            <path d="M12 3 4 7l8 4 8-4-8-4Z"></path>
                            <path d="M4 7v10l8 4 8-4V7"></path>
                            <path d="M12 11v10"></path>
                        </svg>
                    </span>
                </div>
                <div class="stat-value">{{ $totalProducts }} Produk</div>
            </div>

            <div class="stat-card stat-green">
                <div class="stat-top">
                    <span>Pesanan</span>
                    <span class="stat-icon-wrap">
                        <svg viewBox="0 0 24 24" class="stat-icon">
                            <circle cx="9" cy="20" r="1.5"></circle>
                            <circle cx="18" cy="20" r="1.5"></circle>
                            <path d="M3 4h2l2.2 10.2a1 1 0 0 0 1 .8h8.9a1 1 0 0 0 1-.8L20 8H7"></path>
                        </svg>
                    </span>
                </div>
                <div class="stat-value">{{ $totalOrders }} Pesanan</div>
            </div>

            <div class="stat-card stat-light">
                <div class="stat-top">
                    <span>Total Penjualan</span>
                    <span class="stat-icon-wrap">
                        <svg viewBox="0 0 24 24" class="stat-icon">
                            <path d="M4 16l5-5 4 4 7-7"></path>
                            <path d="M14 8h6v6"></path>
                        </svg>
                    </span>
                </div>
                <div class="stat-value">Rp {{ number_format($totalSales, 0, ',', '.') }}</div>
            </div>

            <div class="stat-card stat-cream">
                <div class="stat-top">
                    <span>Tagihan Tertunda</span>
                    <span class="stat-icon-wrap">
                        <svg viewBox="0 0 24 24" class="stat-icon">
                            <path d="M8 3h8l3 3v15H5V3h3"></path>
                            <path d="M8 7h8"></path>
                            <path d="M8 11h8"></path>
                            <path d="M8 15h5"></path>
                        </svg>
                    </span>
                </div>
                <div class="stat-value">{{ $pendingBills }} Tagihan</div>
            </div>
        </div>

        <div class="chart-card">
            <h2>Distribusi Stok</h2>

            <div class="chart-row">
                <div class="chart-box donut-box">
                    <canvas id="stockDistributionChart"></canvas>
                </div>

                <div class="chart-legend-custom">
                    @php
                        $chartColors = ['#44528F', '#F2AE3D', '#E7EBF0', '#66A373', '#8B5CF6', '#EF4444', '#14B8A6'];
                        $totalStokSemua = collect($stockData)->sum();
                    @endphp

                    @foreach($stockLabels as $index => $label)
                        @php
                            $jumlah = $stockData[$index] ?? 0;
                            $persen = $totalStokSemua > 0 ? round(($jumlah / $totalStokSemua) * 100) : 0;
                        @endphp
                        <div class="legend-item">
                            <div class="legend-left">
                                <span class="legend-dot" style="background-color: {{ $chartColors[$index % count($chartColors)] }}"></span>
                                <span>{{ $label }}</span>
                            </div>
                            <strong>{{ $persen }}%</strong>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>

        <div class="chart-card">
            <h2>Grafik Total Penjualan</h2>
            <div class="bar-chart-box">
                <canvas id="salesChart"></canvas>
            </div>
        </div>
    </div>

    <script>
        const stockLabels = @json($stockLabels);
        const stockData = @json($stockData);
        const salesLabels = @json($salesLabels);
        const salesData = @json($salesData);

        const stockColors = ['#44528F', '#F2AE3D', '#E7EBF0', '#66A373', '#8B5CF6', '#EF4444', '#14B8A6'];

        const stockCtx = document.getElementById('stockDistributionChart').getContext('2d');
        new Chart(stockCtx, {
            type: 'doughnut',
            data: {
                labels: stockLabels,
                datasets: [{
                    data: stockData,
                    backgroundColor: stockColors,
                    borderWidth: 8,
                    borderColor: '#ffffff',
                    hoverOffset: 6
                }]
            },
            options: {
                cutout: '68%',
                plugins: {
                    legend: {
                        display: false
                    }
                },
                responsive: true,
                maintainAspectRatio: false
            }
        });

        const salesCtx = document.getElementById('salesChart').getContext('2d');
        new Chart(salesCtx, {
            type: 'bar',
            data: {
                labels: salesLabels,
                datasets: [{
                    label: 'Total Penjualan',
                    data: salesData,
                    backgroundColor: '#44528F',
                    borderRadius: 6,
                    barThickness: 30
                }]
            },
            options: {
                plugins: {
                    legend: {
                        display: false
                    }
                },
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: '#E5E7EB'
                        },
                        ticks: {
                            callback: function(value) {
                                return value.toLocaleString('id-ID');
                            }
                        }
                    },
                    x: {
                        grid: {
                            display: false
                        }
                    }
                }
            }
        });
    </script>
</x-app-layout>