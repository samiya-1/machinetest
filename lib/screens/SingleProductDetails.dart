import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SingleProductPage extends StatefulWidget {
  final String productId;

  SingleProductPage({required this.productId});

  @override
  _SingleProductPageState createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  Map<String, dynamic> productDetails = {};

  @override
  void initState() {
    super.initState();
    _fetchProductDetails();
  }

  Future<void> _fetchProductDetails() async {
    final url = Uri.parse('https://37be-59-94-203-60.ngrok-free.app/api/single_medicine/${widget.productId}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        productDetails = jsonDecode(response.body);
      });
    } else {
      // Handle API error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: productDetails.isNotEmpty
          ? Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${productDetails['name']}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Description: ${productDetails['description']}'),
            SizedBox(height: 8),
            Text('Price: \$${productDetails['price']}'),
            SizedBox(height: 8),
            Text('ID: ${productDetails['id']}'),
          ],
        ),
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
