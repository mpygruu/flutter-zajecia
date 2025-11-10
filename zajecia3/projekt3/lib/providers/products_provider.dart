import 'package:flutter/material.dart';
import 'package:projekt3/models/product.dart';

class ProductsProvider {
  List<Product> produkty = [
    Product(
      id: 1,
      nazwa: "Produkt 1",
      opis: "Opis produktu 1",
      ikona: Icons.coffee,
    ),
    Product(
      id: 2,
      nazwa: "Produkt 2",
      opis: "Opis produktu 2",
      ikona: Icons.cookie,
    ),
    Product(
      id: 3,
      nazwa: "Produkt 3",
      opis: "Opis produktu 3",
      ikona: Icons.coffee,
    ),
  ];
}
