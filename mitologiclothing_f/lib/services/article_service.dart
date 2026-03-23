import '../models/article_model.dart';

class ArticleService {
  Future<List<ArticleModel>> getArticles() async {
    await Future.delayed(const Duration(milliseconds: 700));

    return [
      ArticleModel(
        id: 1,
        title: 'Filosofi Batik dalam Fashion Modern',
        category: 'Budaya',
        excerpt:
            'Menggali makna mendalam di balik setiap motif batik dan bagaimana penerapannya dalam desain kontemporer',
        content:
            'Batik tidak hanya hadir sebagai kain tradisional, tetapi juga sebagai identitas budaya yang terus berkembang dalam dunia fashion modern. Setiap motif memiliki filosofi tersendiri, mulai dari makna tentang kehidupan, harapan, hingga hubungan manusia dengan alam. Dalam fashion modern, batik digunakan tidak hanya sebagai simbol budaya, tetapi juga sebagai elemen desain yang mampu tampil elegan, kuat, dan relevan dengan selera masa kini.',
        imageUrl: 'assets/images/articles/1.jpg',
        readMinutes: 5,
        author: 'Sari Wijaya',
        tag: 'Budaya',
      ),
      ArticleModel(
        id: 2,
        title: 'Cara Merawat Kain Batik Agar Awet',
        category: 'Tips',
        excerpt: 'Tips dan trik merawat batik',
        content:
            'Batik adalah kain yang memerlukan perawatan khusus agar tetap awet dan warnanya tidak cepat pudar. Berikut adalah beberapa tips yang dapat Anda praktikkan di rumah.\n\nPertama, selalu cuci batik dengan tangan menggunakan deterjen yang lembut. Hindari penggunaan mesin cuci karena dapat merusak serat kain dan motif batik.\n\nKedua, jangan menjemur batik di bawah sinar matahari langsung. Jemurlah di tempat yang teduh dan berangin agar warna batik tidak cepat pudar. Setrika batik dalam keadaan setengah kering dengan suhu sedang.',
        imageUrl: 'assets/images/articles/2.jpg',
        readMinutes: 4,
        author: 'Budi Santoso',
        tag: 'Tips',
      ),
      ArticleModel(
        id: 3,
        title: 'Sejarah Motif Batik Nusantara',
        category: 'Sejarah',
        excerpt: 'Menelusuri asal-usul salah satu motif batik',
        content:
            'Motif batik Nusantara berkembang dari berbagai daerah dengan ciri khas yang berbeda. Setiap wilayah memiliki corak, warna, dan filosofi yang terbentuk dari kondisi sosial, budaya, dan sejarah masyarakat setempat.',
        imageUrl: 'assets/images/articles/3.jpg',
        readMinutes: 6,
        author: 'Ratna Dewi',
        tag: 'Sejarah',
      ),
      ArticleModel(
        id: 4,
        title: 'Trend Batik 2026: Street Fashion',
        category: 'Fashion',
        excerpt: 'Bagaimana batik kini menjadi bagian dari gaya urban',
        content:
            'Batik mulai tampil dalam gaya street fashion dengan pendekatan desain yang lebih berani, fleksibel, dan dekat dengan generasi muda. Perpaduan motif tradisional dan siluet modern menjadi salah satu daya tarik utamanya.',
        imageUrl: 'assets/images/articles/4.jpg',
        readMinutes: 5,
        author: 'Dina Prameswari',
        tag: 'Fashion',
      ),
      ArticleModel(
        id: 5,
        title: 'Mengenal Batik Mega Mendung',
        category: 'Budaya',
        excerpt: 'Eksplorasi mendalam tentang salah satu motif khas',
        content:
            'Mega Mendung adalah salah satu motif batik yang sangat dikenal dan memiliki makna keteduhan, kesabaran, dan ketenangan. Motif ini menjadi identitas budaya yang kuat dan banyak diaplikasikan ke berbagai produk fashion.',
        imageUrl: 'assets/images/articles/5.jpg',
        readMinutes: 4,
        author: 'Rani Kusuma',
        tag: 'Budaya',
      ),
      ArticleModel(
        id: 6,
        title: 'Batik Sebagai Warisan Indonesia',
        category: 'Sejarah',
        excerpt: 'Perjalanan batik Indonesia',
        content:
            'Batik telah menjadi warisan budaya yang diakui dunia. Nilai sejarah, filosofi, dan teknik pembuatannya membuat batik menjadi simbol penting identitas Indonesia.',
        imageUrl: 'assets/images/articles/6.jpg',
        readMinutes: 7,
        author: 'Agus Prabowo',
        tag: 'Sejarah',
      ),
    ];
  }
}