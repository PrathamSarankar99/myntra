import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myntra/modals/IconType.dart';
import 'package:myntra/modals/product.dart';
import 'package:myntra/screens/search_page.dart';
import 'package:myntra/widgets/appbar_actions.dart';
import 'package:myntra/widgets/page_display.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          AppBarAction(
              type: IconType.search,
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      SearchPage(),
                ));
              }),
          AppBarAction(
              type: IconType.cart,
              onTap: () {
                //
              }),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          PageDisplay(
            urlList: widget.product.imageURLs,
            height: 400,
            verticalMargin: 0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 12, bottom: 3),
                  child: Text(
                    widget.product.productName,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, left: 12, bottom: 5),
                  child: Text(
                    widget.product.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '₹',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        calculatePrice(
                                widget.product.price, widget.product.discount)
                            .toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      if (widget.product.discount != 0)
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 3),
                          child: Text(
                            '₹${widget.product.price}',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey.shade700,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                      if (widget.product.discount != 0)
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 3),
                          child: Text(
                            '${widget.product.discount.toInt()}% OFF',
                            style: TextStyle(
                              fontSize: 15,
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
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 10),
            child: Stack(
              children: [
                Positioned(
                  top: 2,
                  left: 12,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 2,
                            ),
                            Text(widget.product.rating.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          '${widget.product.totalRating} ratings',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String calculatePrice(int price, double discount) {
    return (price - ((discount / 100) * price)).toInt().toString();
  }
}
