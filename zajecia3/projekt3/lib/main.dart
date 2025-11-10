import 'package:flutter/material.dart';
import 'package:projekt3/pages/product_details_page.dart';
import 'package:projekt3/pages/product_list_page.dart';
import 'package:projekt3/providers/favorites_provider.dart';
import 'package:projekt3/providers/products_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProductsProvider>(create: (context) => ProductsProvider()),
        ChangeNotifierProvider<FavoritesProvider>(
          create: (context) => FavoritesProvider(),
        ),
      ],
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (context) => ProductListPage(),
          "/product-details": (context) => ProductDetailsPage(),
        },
      ),
    );
  }
}
