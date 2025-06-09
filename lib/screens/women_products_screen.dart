import 'package:apparel_store/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class WomenProductsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {'name': 'Shirt-style collar', 'price': 2199.0, 'image': 'assets/images/womens.jpg'},
    {'name': 'Skirts', 'price': 1899.0, 'image': 'assets/images/skirt.jpg'},
    {'name': 'Blouse', 'price': 1499.0, 'image': 'assets/images/blouse.jpg'},
    {'name': 'Crop Top', 'price': 2799.0, 'image': 'assets/images/crop.jpg'},
    {'name': 'Jeans', 'price': 999.0, 'image': 'assets/images/w-jeans.jpg'},
    {'name': 'Work Shirts', 'price': 3499.0, 'image': 'assets/images/shirts-w.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: AppBar(title: const Text("Women's Products"), centerTitle: true),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isLandscape ? 3 : 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            name: product['name'],
            price: product['price'],
            image: product['image'],
             onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(
                    name: product['name'],
                    price: product['price'],
                    image: product['image'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
