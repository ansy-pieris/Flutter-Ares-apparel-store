import 'package:apparel_store/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class FootwearProductsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {'name': 'Sneakers', 'price': 2999.0, 'image': 'assets/images/sneakers.jpeg'},
    {'name': 'Formal Shoes', 'price': 4599.0, 'image': 'assets/images/formal.jpg'},
    {'name': 'High Heels', 'price': 1599.0, 'image': 'assets/images/heels.webp'},
    {'name': 'Boots', 'price': 5499.0, 'image': 'assets/images/boots.webp'},
    {'name': 'Flip-flops', 'price': 999.0, 'image': 'assets/images/flip.webp'},
    {'name': 'Loafers', 'price': 3899.0, 'image': 'assets/images/loafers.webp'},
  ];

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: AppBar(title: const Text("Footwear"), centerTitle: true),
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
