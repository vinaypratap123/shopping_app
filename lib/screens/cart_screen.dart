import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/app/app_colors.dart';
import 'package:shopping_app/app/app_strings.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.cart,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  cartItem["imageUrl"].toString(),
                ),
              ),
              title: Text(
                cartItem["title"].toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text(
                cartItem["size"].toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              trailing: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        surfaceTintColor: AppColor.whiteColor,
                        child: SizedBox(
                          height: 200,
                          width: 350,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                AppString.areYouSureYouWantToRemoveItemFromCart,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      minimumSize: const Size(130, 40),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      AppString.cancel,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      minimumSize: const Size(130, 40),
                                    ),
                                    onPressed: () {
                                      Provider.of<CartProvider>(context,
                                              listen: false)
                                          .removeProduct(cartItem);

                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      AppString.remove,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Icon(
                  Icons.delete,
                  color: AppColor.redColor,
                ),
              ),
            );
          }),
    );
  }
}
