import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'SingleProductDetails.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<dynamic> productList = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final url = Uri.parse('https://37be-59-94-203-60.ngrok-free.app/api/get_medicine');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        productList = jsonDecode(response.body);
      });
    } else {
      // Handle API error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: productList.isNotEmpty
          ? ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SingleProductPage(productId: productList[index]['id']),
                ),
              );
            },
            child: ListTile(
              title: Text(productList[index]['name']),
              subtitle: Text(productList[index]['description']),
              trailing: Text('\$${productList[index]['price']}'),
            ),
          );
        },
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
