import 'package:flutter/material.dart';
import 'package:flutter_gatjed_poc/src/constants/strings.dart';
import 'package:flutter_gatjed_poc/src/features/products/bloc/products_bloc.dart';
import 'package:flutter_gatjed_poc/src/features/products/model/products_response.dart';
import 'package:flutter_gatjed_poc/src/features/products/model/view_type.dart';
import 'package:flutter_gatjed_poc/src/features/products/view/sub_views/product_grid_item.dart';
import 'package:flutter_gatjed_poc/src/features/products/view/sub_views/product_list_item.dart';
import 'package:flutter_gatjed_poc/src/utils/HexColor.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ViewType _viewType = ViewType.LIST;

  @override
  void initState() {
    super.initState();
    bloc.getAllProducts();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Strings.gatjed_general_products),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            tooltip: Strings.gatjed_products_open_shopping_cart,
            onPressed: () {},
          ),
        ],
      ),
      body: buildScreenContents(),
    );
  }

  Widget buildScreenContents() {
    return Column(
      children: <Widget>[
        Material(
          elevation: 1.0,
          child: Column(
            children: <Widget>[
              Material(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  height: 60.0,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      hintText: Strings.gatjed_general_search,
                    ),
                  ),
                ),
              ),
              Container(
                height: 40.0,
                child: AppBar(
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                  leading: IconButton(
                    icon: Icon(Icons.sort),
                    color: HexColor("#4a4a4a"),
                    onPressed: () {},
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.view_module,
                        color: _viewType == ViewType.GRID
                            ? HexColor("#d8a01f")
                            : HexColor("#4a4a4a"),
                      ),
                      onPressed: () => _toggleViewType(ViewType.GRID),
                    ),
                    IconButton(
                      icon: Icon(Icons.view_list),
                      color: _viewType == ViewType.LIST
                          ? HexColor("#d8a01f")
                          : HexColor("#4a4a4a"),
                      onPressed: () => _toggleViewType(ViewType.LIST),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        StreamBuilder<List<Product>>(
          stream: bloc.allProducts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _viewType == ViewType.LIST
                  ? _displayListView(snapshot.data)
                  : _displayGridView(snapshot.data);
            }
            return Expanded(child: Center(child: CircularProgressIndicator()));
          },
        )
      ],
    );
  }

  void _toggleViewType(ViewType type) {
    if (_viewType != type) {
      setState(() {
        _viewType = _viewType == ViewType.LIST ? ViewType.GRID : ViewType.LIST;
      });
    }
  }

  Widget _displayListView(List<Product> products) {
    return Expanded(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductListItem(
            product: products[index],
          );
        },
      ),
    );
  }

  Widget _displayGridView(List<Product> products) {
    return Expanded(
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductGridItem(
            product: products[index],
          );
        },
      ),
    );
  }
}
