import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryName;

  CategoryScreen({required this.categoryName});

  final List<Map<String, dynamic>> products = [
    {'name': 'Product A', 'price': 24.99, 'image': 'assets/images/Ares.jpg'},
    {'name': 'Product B', 'price': 34.99, 'image': 'assets/images/Ares.jpg'},
    {'name': 'Product C', 'price': 44.99, 'image': 'assets/images/Ares.jpg'},
    {'name': 'Product D', 'price': 54.99, 'image': 'assets/images/Ares.jpg'},
    {'name': 'Product E', 'price': 54.99, 'image': 'assets/images/Ares.jpg'},
    {'name': 'Product F', 'price': 54.99, 'image': 'assets/images/Ares.jpg'},
    {'name': 'Product G', 'price': 54.99, 'image': 'assets/images/Ares.jpg'},
    {'name': 'Product H', 'price': 54.99, 'image': 'assets/images/Ares.jpg'},
    {'name': 'Product I', 'price': 54.99, 'image': 'assets/images/Ares.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('$categoryName'),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(
              name: product['name'],
              price: product['price'],
              image: product['image'],
            );
          },
        ),
      ),
    );
  }
}
