import 'product_controller.dart';

class SearchController {
  final ProductController productController;
  List<Map<String, String>> allProducts;
  List<Map<String, String>> filteredProducts;

  SearchController(this.productController)
      : allProducts = productController.categories.values
            .expand((category) => category)
            .toList(),
        filteredProducts = [];

  void updateSearchQuery(String query) {
    if (query.isEmpty) {
      filteredProducts = List.from(allProducts);
    } else {
      filteredProducts = allProducts.where((product) {
        return product['name']!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }
}
