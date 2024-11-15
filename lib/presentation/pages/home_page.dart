import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';
import '../controllers/product_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;
  final ProductController productController = ProductController();

  HomePage(this.controller);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting and Search Bar
              Text(
                'Hallo, User',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Promotional Banner
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.orangeAccent,
                ),
                child: Center(
                  child: Text(
                    'Pangan Mart\nToko Pangan Terlengkap',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Featured Products Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Produk Unggulan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/category');
                    },
                    child: Text('more'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul Kategori
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 1.0),
                    child: Text(
                      'Buah', // Nama kategori
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              // List of products
              SizedBox(
                height: 300, // Adjust the height as needed
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: productController.categories['Buah']!.length,
                  itemBuilder: (context, index) {
                    final product =
                        productController.categories['Buah']![index];
                    return ProductCard(
                      productName: product['name']!,
                      price: product['price']!,
                      imageAsset: product['image']!,
                    );
                  },
                ),
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul Kategori
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 1.0),
                    child: Text(
                      'Sayur', // Nama kategori
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 300, // Adjust the height as needed
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: productController.categories['Sayur']!.length,
                  itemBuilder: (context, index) {
                    final product =
                        productController.categories['Sayur']![index];
                    return ProductCard(
                      productName: product['name']!,
                      price: product['price']!,
                      imageAsset: product['image']!,
                    );
                  },
                ),
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul Kategori
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 1.0),
                    child: Text(
                      'Daging', // Nama kategori
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 300, // Adjust the height as needed
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: productController.categories['Daging']!.length,
                  itemBuilder: (context, index) {
                    final product =
                        productController.categories['Daging']![index];
                    return ProductCard(
                      productName: product['name']!,
                      price: product['price']!,
                      imageAsset: product['image']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      selectedIndex: 0, // Home tab is selected
      controller: controller,
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final IconData iconData;
  final String collections;

  CategoryCard(this.categoryName, this.iconData, this.collections);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.blueAccent,
        margin: EdgeInsets.all(4.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(iconData, size: 40, color: Colors.white),
              SizedBox(height: 10),
              Text(
                categoryName,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                collections,
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String price;
  final String imageAsset;

  ProductCard({
    required this.productName,
    required this.price,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageAsset),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(productName, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(price),
          ],
        ),
      ),
    );
  }
}
