import 'package:flutter/material.dart';

class Product {
  final int id;
  final String nazwa;
  final String opis;
  final IconData ikona;

  const Product({
    required this.id,
    required this.nazwa,
    required this.opis,
    required this.ikona,
  });
}
