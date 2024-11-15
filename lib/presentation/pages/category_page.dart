import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';
import '../controllers/product_controller.dart';

class CategoryPage extends StatefulWidget {
  final HomeController controller;

  CategoryPage(this.controller);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final ProductController productController = ProductController();
  String selectedCategory = 'Semua'; // Default category
  List<Map<String, String>> displayedProducts = [];
  List<Map<String, String>> allProducts = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    allProducts = productController.categories.values
        .expand((category) => category)
        .toList();
    displayedProducts = List.from(allProducts);
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        displayedProducts = List.from(allProducts);
      } else {
        displayedProducts = allProducts.where((product) {
          return product['name']!.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  void updateCategory(String category) {
    setState(() {
      selectedCategory = category;
      if (category == 'Semua') {
        displayedProducts = List.from(allProducts);
      } else {
        displayedProducts = productController.getProducts(selectedCategory);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: searchController, // Set the controller
                decoration: InputDecoration(
                  hintText: 'Cari Produk',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Category icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryIcon(Icons.all_inclusive, 'Semua'),
                _buildCategoryIcon(Icons.apple, 'Buah'),
                _buildCategoryIcon(Icons.eco, 'Sayur'),
                _buildCategoryIcon(Icons.restaurant, 'Daging'),
                _buildCategoryIcon(Icons.rice_bowl, 'Pokok'),
                _buildCategoryIcon(Icons.kitchen, 'Dapur'),
              ],
            ),
            SizedBox(height: 10),

            // Products grid title
            Text(
              'Produk' +
                  (selectedCategory == 'Semua' ? '' : ' $selectedCategory'),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Products grid
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: displayedProducts.length,
                itemBuilder: (context, index) {
                  final product = displayedProducts[index];
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
      selectedIndex: 1,
      controller: widget.controller,
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return GestureDetector(
      onTap: () => updateCategory(label),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade100,
            child: Icon(icon, color: Colors.blue),
          ),
          SizedBox(height: 8.0),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
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
