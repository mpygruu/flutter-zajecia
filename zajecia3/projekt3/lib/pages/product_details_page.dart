import 'package:flutter/material.dart';
import 'package:projekt3/models/product.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final produkt = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(title: Text(produkt.nazwa)),
      body: Center(
        child: Column(
          children: [
            Icon(produkt.ikona, size: 200),
            Text(produkt.opis, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
