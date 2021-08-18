import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isfavorite = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(
                    getURL(),
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
                            'Product Name',
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
                        setState(() {
                          isfavorite = !isfavorite;
                        });
                      },
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.grey.shade100),
                        shape: MaterialStateProperty.all(CircleBorder()),
                      ),
                      child: Icon(
                        isfavorite
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
                      '699',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        '₹1599',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey.shade700,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        '45% OFF',
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
    );
  }

  String getURL() {
    List list = [
      'https://assets.myntassets.com/f_webp,dpr_1.0,q_60,w_210,c_limit,fl_progressive/assets/images/2414313/2018/3/13/11520926368526-HERENOW-Men-Red--Black-Regular-Fit-Checked-Casual-Shirt-8881520926368447-1.jpg',
      'https://m.media-amazon.com/images/I/61HF0fmRw5L._AC_UL320_.jpg',
      'https://m.media-amazon.com/images/I/61JpEl-p1rL._AC_UL320_.jpg',
      'https://m.media-amazon.com/images/I/A18mwMLMdqL._AC_UL320_.jpg',
      'https://m.media-amazon.com/images/I/71AduIOF3PL._AC_UL320_.jpg',
      'https://m.media-amazon.com/images/I/81LYcYb0A4L._AC_UL320_.jpg',
      'https://m.media-amazon.com/images/I/81zf2nTEaAL._AC_UL320_.jpg',
      'https://assets.myntassets.com/f_webp,dpr_1.0,q_60,w_210,c_limit,fl_progressive/assets/images/14169582/2021/6/19/818cbe7d-e6e0-43bf-86d4-3a090a5c086e1624100023879-HERENOW-Men-Shirts-1251624100023350-1.jpg'
    ];
    list.shuffle();
    return list[0];
  }
}
