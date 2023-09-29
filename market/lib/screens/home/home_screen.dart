import 'package:flutter/material.dart';
import 'package:market/widgets/products_grid.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isLoading = false;
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ProductsGrid(_showOnlyFavorites);
  }
}
