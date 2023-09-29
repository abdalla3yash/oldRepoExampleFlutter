import 'package:flutter/material.dart';
import 'package:market/widgets/products_grid.dart';

class FavoriteScreen extends StatelessWidget {
  var _showOnlyFavorites = true;
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ProductsGrid(_showOnlyFavorites);
  }
}
