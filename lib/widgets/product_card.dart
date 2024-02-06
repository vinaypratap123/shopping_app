import 'package:flutter/material.dart';
import 'package:shopping_app/app/app_colors.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: AppColor.cardColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            Text("\$$price", style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Image.asset(
                imageUrl,
                height: 160,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
