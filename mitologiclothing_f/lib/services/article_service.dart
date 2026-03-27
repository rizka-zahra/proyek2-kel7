import '../models/article_model.dart';

class ArticleService {
  Future<List<ArticleModel>> getArticles() async {
    await Future.delayed(const Duration(milliseconds: 700));

    return [
      ArticleModel(
        id: 1,
        categoryId: 1,
        title: 'Filosofi Batik dalam Fashion Modern',
        content:
            'Batik tidak hanya hadir sebagai kain tradisional, tetapi juga sebagai identitas budaya yang terus berkembang dalam dunia fashion modern. Setiap motif memiliki filosofi tersendiri, mulai dari makna tentang kehidupan, harapan, hingga hubungan manusia dengan alam. Dalam fashion modern, batik digunakan tidak hanya sebagai simbol budaya, tetapi juga sebagai elemen desain yang mampu tampil elegan, kuat, dan relevan dengan selera masa kini.',
        imageUrl: 'assets/images/articles/1.jpg',
        publishedDate: '2026-03-24',
      ),
      ArticleModel(
        id: 2,
        categoryId: 2,
        title: 'Cara Merawat Kain Batik Agar Awet',
        content:
            'Batik adalah kain yang memerlukan perawatan khusus agar tetap awet dan warnanya tidak cepat pudar. Berikut adalah beberapa tips yang dapat dipraktikkan di rumah.\n\nPertama, selalu cuci batik dengan tangan menggunakan deterjen yang lembut. Hindari penggunaan mesin cuci karena dapat merusak serat kain dan motif batik.\n\nKedua, jangan menjemur batik di bawah sinar matahari langsung. Jemurlah di tempat yang teduh dan berangin agar warna batik tidak cepat pudar. Setrika batik dalam keadaan setengah kering dengan suhu sedang.',
        imageUrl: 'assets/images/articles/2.jpg',
        publishedDate: '2026-03-23',
      ),
      ArticleModel(
        id: 3,
        categoryId: 3,
        title: 'Sejarah Motif Batik Nusantara',
        content:
            'Motif batik Nusantara berkembang dari berbagai daerah dengan ciri khas yang berbeda. Setiap wilayah memiliki corak, warna, dan filosofi yang terbentuk dari kondisi sosial, budaya, dan sejarah masyarakat setempat.',
        imageUrl: 'assets/images/articles/3.jpg',
        publishedDate: '2026-03-22',
      ),
      ArticleModel(
        id: 4,
        categoryId: 4,
        title: 'Trend Batik 2026: Street Fashion',
        content:
            'Batik mulai tampil dalam gaya street fashion dengan pendekatan desain yang lebih berani, fleksibel, dan dekat dengan generasi muda. Perpaduan motif tradisional dan siluet modern menjadi salah satu daya tarik utamanya.',
        imageUrl: 'assets/images/articles/4.jpg',
        publishedDate: '2026-03-21',
      ),
      ArticleModel(
        id: 5,
        categoryId: 1,
        title: 'Mengenal Batik Mega Mendung',
        content:
            'Mega Mendung adalah salah satu motif batik yang sangat dikenal dan memiliki makna keteduhan, kesabaran, dan ketenangan. Motif ini menjadi identitas budaya yang kuat dan banyak diaplikasikan ke berbagai produk fashion.',
        imageUrl: 'assets/images/articles/5.jpg',
        publishedDate: '2026-03-20',
      ),
      ArticleModel(
        id: 6,
        categoryId: 3,
        title: 'Batik Sebagai Warisan Indonesia',
        content:
            'Batik telah menjadi warisan budaya yang diakui dunia. Nilai sejarah, filosofi, dan teknik pembuatannya membuat batik menjadi simbol penting identitas Indonesia.',
        imageUrl: 'assets/images/articles/6.jpg',
        publishedDate: '2026-03-19',
      ),
    ];
  }
}