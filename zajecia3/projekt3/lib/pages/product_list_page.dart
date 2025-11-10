import 'package:flutter/material.dart';
import 'package:projekt3/models/product.dart';
import 'package:projekt3/providers/favorites_provider.dart';
import 'package:projekt3/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productsProvider = context.read<ProductsProvider>();
    final favoritesProvider = context.watch<FavoritesProvider>();

    List<Product> produkty = productsProvider.produkty;

    final showOnlyFavorites = context
        .watch<FavoritesProvider>()
        .showOnlyFavorites;

    final shownProducts = showOnlyFavorites
        ? produkty.where(
            (produkt) => favoritesProvider.favoritesIds.contains(produkt.id),
          )
        : produkty;

    return Scaffold(
      appBar: AppBar(
        title: Text("Projekt 3"),
        actions: [
          IconButton(
            onPressed: favoritesProvider.toggleShowFavorites,
            icon: Icon(Icons.filter_alt),
          ),
        ],
      ),
      body: ListView(
        children: shownProducts
            .map(
              (produkt) => ListTile(
                leading: Icon(produkt.ikona),
                title: Text(produkt.nazwa),
                trailing: IconButton(
                  onPressed: () => favoritesProvider.toggleFavorite(produkt.id),
                  icon: favoritesProvider.favoritesIds.contains(produkt.id)
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_outline),
                ),
                onTap: () => Navigator.pushNamed(
                  context,
                  "/product-details",
                  arguments: produkt,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
