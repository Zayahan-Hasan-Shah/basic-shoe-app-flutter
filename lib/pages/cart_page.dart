import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_notifier.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              backgroundColor: Colors.transparent,
              radius: 32,
            ),
            trailing: IconButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Delete Product',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        content: Text(
                            'Are you sure you want to remove the product from the cart?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context.read<CartProvider>();
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'No',
                              style: TextStyle(
                                color: Color.fromRGBO(78, 167, 214, 1),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context
                                  .read<CartProvider>()
                                  .removeProduct(cartItem);
                              Navigator.of(context).pop();
                            },
                            child: Text('Yes',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 231, 79, 92))),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('size : ${cartItem['size']}'),
          );
        },
      ),
    );
  }
}
