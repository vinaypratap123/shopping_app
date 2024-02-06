import 'package:flutter/material.dart';
import 'package:shopping_app/app/app_colors.dart';
import 'package:shopping_app/app/app_strings.dart';
import 'package:shopping_app/app/constants.dart';
import 'package:shopping_app/screens/product_details_screen.dart';
import 'package:shopping_app/widgets/product_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> filters = [
    "All",
    "Addidas",
    "Nike",
    "Campus",
    "Puma",
  ];
  late String selectedFilter;
  @override
  initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  final border = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.cardColor,
    ),
    borderRadius: BorderRadius.horizontal(
      left: Radius.circular(40),
      right: Radius.circular(40),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  AppString.shoesCollection,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: AppString.search,
                      prefixIcon: const Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      side: const BorderSide(
                        color: AppColor.cardColor,
                      ),
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : AppColor.cardColor,
                      label: Text(filters[index]),
                      labelStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (contex) => ProductDetail(product: product),
                      ),
                    );
                  },
                  child: ProductCard(
                    title: product["title"] as String,
                    price: product["price"] as double,
                    imageUrl: product["imageUrl"] as String,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
