import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myntra/modals/product.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({
    Key? key,
    required this.product,
    required this.removeFavourite,
  }) : super(key: key);
  final Product product;
  final Function(Product) removeFavourite;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        product.imageURLs[0],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: TextButton(
                    clipBehavior: Clip.none,
                    onPressed: () {
                      removeFavourite(product);
                    },
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                            Colors.grey.shade100.withOpacity(0.2)),
                        shape: MaterialStateProperty.all(CircleBorder()),
                        minimumSize: MaterialStateProperty.all(Size(40, 40))),
                    child: Icon(
                      Icons.clear,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 12),
                child: Text(
                  product.productName,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 5, bottom: 15),
                child: Row(
                  children: [
                    Text(
                      '₹',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Text(
                      calculatePrice(product.price, product.discount)
                          .toString(),
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    if (product.discount != 0)
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          '₹${product.price}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey.shade700,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                    if (product.discount != 0)
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          '${product.discount.toInt()}% OFF',
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
        )),
        Divider(
          thickness: 1,
          height: 1,
        ),
        Container(
          height: 40,
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 40))),
            child: Text('Move to bag'),
          ),
        )
      ],
    );
  }

  String calculatePrice(int price, double discount) {
    return (price - ((discount / 100) * price)).toInt().toString();
  }
}
