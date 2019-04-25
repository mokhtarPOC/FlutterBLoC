import 'package:flutter/material.dart';
import 'package:flutter_gatjed_poc/src/features/products/model/products_response.dart';
import 'package:flutter_gatjed_poc/src/utils/HexColor.dart';

class ProductGridItem extends StatefulWidget {
  final Product product;

  const ProductGridItem({@required this.product}) : assert(product != null);

  @override
  _ProductGridItemState createState() => _ProductGridItemState();
}

class _ProductGridItemState extends State<ProductGridItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
        ),
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  widget.product.image,
                  height: 162.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: _toggleFavourite,
                    child: widget.product.isFavourite
                        ? Icon(
                            Icons.favorite,
                            color: HexColor("#ecb838"),
                          )
                        : Icon(Icons.favorite_border),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  color: HexColor("#ecb838"),
                  child: Text(
                    "50% OFF",
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
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
                  Center(
                    child: FlatButton.icon(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: () {},
                      icon: Icon(Icons.add_shopping_cart),
                      label: Text("ADD TO CART"),
                    ),
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
