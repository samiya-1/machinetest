import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cartProvider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cart App')),
      body: ListView.builder(
        itemCount: cartProvider.items.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(cartProvider.items[index].product.name),
          subtitle: Text('Quantity: ${cartProvider.items[index].quantity}'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => cartProvider.removeFromCart(cartProvider.items[index].product.id),
          ),
        ),
      ),
    );
  }
}
