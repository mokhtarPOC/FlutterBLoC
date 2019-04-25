import 'package:flutter/material.dart';
import 'package:flutter_gatjed_poc/src/features/products/model/products_response.dart';
import 'package:flutter_gatjed_poc/src/utils/HexColor.dart';

class ProductListItem extends StatefulWidget {
  final Product product;

  const ProductListItem({@required this.product}) : assert(product != null);

  @override
  _ProductListItemState createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  widget.product.image,
                  height: 100.0,
                  width: 100.0,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.product.title),
                  Row(
                    children: <Widget>[
                      Text("${widget.product.rating}"),
                      Icon(
                        Icons.star,
                        color: HexColor("#ecb838"),
                      ),
                      Text("(${widget.product.reviewersCount})"),
                    ],
                  ),
                  Text("350 EGP"),
                  Visibility(
                    visible: widget.product.isFreeShipping,
                    child: Text("Free shipping"),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FlatButton.icon(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: () {},
                        icon: Icon(Icons.add_shopping_cart),
                        label: Text("ADD TO CART"),
                      ),
                      VerticalDivider(
                        color: Colors.red,
                      ),
                      GestureDetector(
                        onTap: _toggleFavourite,
                        child: widget.product.isFavourite
                            ? Icon(
                                Icons.favorite,
                                color: HexColor("#ecb838"),
                              )
                            : Icon(Icons.favorite_border),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleFavourite() {
    setState(() {
      widget.product.isFavourite = !widget.product.isFavourite;
    });
  }
}
