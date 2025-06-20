import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> bestSellers = [
    {'name': 'Sneakers', 'price': 14500.00, 'image': 'assets/images/sneakers.jpeg'},
    {'name': 'Watch', 'price': 20000.00, 'image': 'assets/images/watch.jpg'},
    {'name': 'T-Shirt', 'price': 6000.00, 'image': 'assets/images/shirt.jpg'},
    {'name': 'Shirt-style collar', 'price': 7500.00, 'image': 'assets/images/womens.jpg'},
  ];

  final List<Map<String, dynamic>> featuredProducts = [
    {'name': 'Jeans', 'price': 11500.00, 'image': 'assets/images/shirts.jpg'},
    {'name': 'Shirts', 'price': 5750.00, 'image': 'assets/images/shirts1.jpg'},
    {'name': 'T-shirts', 'price': 6000.00, 'image': 'assets/images/shirt.jpg'},
    {'name': 'Shirt-style collar', 'price': 7500.00, 'image': 'assets/images/womens.jpg'},
    {'name': 'Sneakers', 'price': 14500.00, 'image': 'assets/images/sneakers.jpeg'},
    {'name': 'Watch', 'price': 20000.00, 'image': 'assets/images/watch.jpg'},
  ];

  final List<String> carouselImages = [
    'assets/images/Ares.jpg',
    'assets/images/hero.jpg',
    'assets/images/hero2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final bgColor = isDark ? Colors.black : Colors.white;
    final cardColor = isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF5F5F5);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            Image.asset('assets/images/Logo2.png', width: 70, height: 70),
            const SizedBox(width: 8),
            Text(
              'ARES',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            CarouselSlider(
              options: CarouselOptions(
                height: isPortrait ? 240 : 180,
                aspectRatio: isPortrait ? 16 / 9 : 21 / 9,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: carouselImages.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imagePath,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            
            Text(
              "Best Sellers",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: isPortrait ? 260 : 220,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: bestSellers.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final product = bestSellers[index];
                  return SizedBox(
                    width: isPortrait ? 160 : 200,
                    child: ProductCard(
                      name: product['name'],
                      price: product['price'],
                      image: product['image'],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            
            Text(
              "Featured Products",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: isPortrait ? 2 : 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: isPortrait ? 0.65 : 0.8,
              children: featuredProducts.map((product) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            product['image'],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product['name'],
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: List.generate(
                          5,
                          (index) => const Icon(Icons.star, size: 14, color: Colors.amber),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "LKR ${product['price'].toStringAsFixed(2)}",
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.favorite_border, color: textColor),
                          Icon(Icons.shopping_cart_outlined, color: textColor),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
