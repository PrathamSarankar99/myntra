import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myntra/modals/product.dart';
import 'package:myntra/screens/product_details_page.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {Key? key,
      required this.product,
      required this.addToFavourite,
      required this.index})
      : super(key: key);
  final Product product;
  final int index;
  final Function(int) addToFavourite;
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ProductDetails(
            product: widget.product,
          ),
        ));
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.product.imageURLs[0],
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 12),
                            child: Text(
                              widget.product.productName,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, left: 12),
                            child: Text(
                              'Description text for product',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black.withOpacity(0.7),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextButton(
                        onPressed: () {
                          widget.addToFavourite(widget.index);
                        },
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.grey.shade100),
                          shape: MaterialStateProperty.all(CircleBorder()),
                        ),
                        child: Icon(
                          widget.product.isfavourite
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          color: Colors.black.withOpacity(0.65),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      Text(
                        '₹',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Text(
                        calculatePrice(
                                widget.product.price, widget.product.discount)
                            .toString(),
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      if (widget.product.discount != 0)
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            '₹${widget.product.price}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey.shade700,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      if (widget.product.discount != 0)
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            '${widget.product.discount.toInt()}% OFF',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.red.shade500,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String calculatePrice(int price, double discount) {
    return (price - ((discount / 100) * price)).toInt().toString();
  }
}
