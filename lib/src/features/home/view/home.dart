import 'package:flutter/material.dart';
import 'package:flutter_gatjed_poc/src/constants/strings.dart';
import 'package:flutter_gatjed_poc/src/features/products/view/products_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.gatjed_general_app_name),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(Strings.gatjed_general_next),
          onPressed: () => _navigateToProductsScreen(context),
        ),
      ),
    );
  }

  void _navigateToProductsScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductsScreen(),
      ),
    );
  }
}
