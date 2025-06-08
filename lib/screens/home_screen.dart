import 'package:flutter/material.dart';
import '../widgets/category_tile.dart';
import '../widgets/product_card.dart';
import 'category_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'name': 'Men', 'image': 'assets/images/Ares.jpg'},
    {'name': 'Women', 'image': 'assets/images/Ares.jpg'},
    {'name': 'Footwear', 'image': 'assets/images/Ares.jpg'},
    {'name': 'Accessories', 'image': 'assets/images/Ares.jpg'},
  ];

  final List<Map<String, dynamic>> products = [
    {'name': 'T-Shirt', 'price': 19.99, 'image': 'assets/images/Ares.jpg'},
    {'name': 'Sneakers', 'price': 59.99, 'image': 'assets/images/Ares.jpg'},
    {'name': 'Watch', 'price': 29.99, 'image': 'assets/images/Ares.jpg'},
    {'name': 'Jeans', 'price': 39.99, 'image': 'assets/images/Ares.jpg'},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false, // Align to the left
        title: Row(
          children: [
            Image.asset(
              'assets/images/Logo.png', // Use your actual logo path
              width: 70,
              height: 70,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Center(
                child: Text(
                  'ARES',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),

            // Horizontal category list
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => CategoryScreen(categoryName: cat['name']!),
                        ),
                      );
                    },
                    child: CategoryTile(
                      name: cat['name']!,
                      image: cat['image']!,
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20),
            Text(
              "Featured Products",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),

            Expanded(
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
          ],
        ),
      ),
    );
  }
}
