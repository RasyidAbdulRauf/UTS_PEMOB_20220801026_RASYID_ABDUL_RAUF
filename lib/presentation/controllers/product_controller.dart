class ProductController {
  final Map<String, List<Map<String, String>>> categories = {
    'Buah': [
      {
        'name': 'Apel',
        'price': '\Rp 20.000',
        'image': 'assets/product/apel.png'
      },
      {
        'name': 'Pisang',
        'price': '\Rp 15.000',
        'image': 'assets/product/pisang.png'
      },
      {
        'name': 'Mangga',
        'price': '\Rp 15.000',
        'image': 'assets/product/mangga.png'
      },
      {
        'name': 'Pepaya',
        'price': '\Rp 15.000',
        'image': 'assets/product/pepaya.png'
      },
    ],
    'Sayur': [
      {
        'name': 'Wortel',
        'price': '\Rp 20.000',
        'image': 'assets/product/wortel.png'
      },
      {
        'name': 'Brokoli',
        'price': '\Rp 15.000',
        'image': 'assets/product/brokoli.png'
      },
      {'name': 'Kol', 'price': '\Rp 15.000', 'image': 'assets/product/kol.png'},
      {
        'name': 'Bayam',
        'price': '\Rp 15.000',
        'image': 'assets/product/bayam.png'
      },
    ],
    'Daging': [
      {
        'name': 'Daging Ayam',
        'price': '\Rp 40.000',
        'image': 'assets/product/ayam.png'
      },
      {
        'name': 'Daging Sapi',
        'price': '\Rp 50.000',
        'image': 'assets/product/sapi.png'
      },
    ],
    'Pokok': [
      {
        'name': 'Beras',
        'price': '\Rp 150.000',
        'image': 'assets/product/beras.png'
      },
      {
        'name': 'Gula Pasir',
        'price': '\Rp 15.000',
        'image': 'assets/product/gula.png'
      },
    ],
    'Dapur': [
      {
        'name': 'Bawang Merah',
        'price': '\Rp 5.000',
        'image': 'assets/product/bawang.png'
      },
      {
        'name': 'Garam',
        'price': '\Rp 5.000',
        'image': 'assets/product/garam.png'
      },
    ],
  };

  List<Map<String, String>> getProducts(String category) {
    return categories[category] ?? [];
  }
}
