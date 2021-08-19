import 'package:flutter/material.dart';
import 'package:myntra/modals/IconType.dart';
import 'package:myntra/modals/product.dart';
import 'package:myntra/screens/favourite_page.dart';
import 'package:myntra/screens/search_page.dart';
import 'package:myntra/services/constants.dart';
import 'package:myntra/widgets/appbar_actions.dart';
import 'package:myntra/widgets/product_card.dart';

import 'cart_page.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({
    Key? key,
    required this.searchText,
  }) : super(key: key);
  final String searchText;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late List<Product> result;

  @override
  void initState() {
    result = dummyProducts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        actions: [
          AppBarAction(
            type: IconType.search,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          SearchPage()));
            },
          ),
          AppBarAction(
            type: IconType.favourite,
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Favourite())).then((value) => setState(() {}));
            },
          ),
          AppBarAction(
            type: IconType.cart,
            onTap: () {
              // Navigator.pop(context);
            },
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.black.withOpacity(0.7),
        ),
        elevation: 0,
        titleSpacing: 0,
        title: ListTile(
          title: Text(
            widget.searchText.toUpperCase(),
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          subtitle: Text(
            result.length.toString(),
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.only(),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 1.5,
          crossAxisSpacing: 1.5,
          childAspectRatio: 6 / 10,
          children: List.generate(
            result.length,
            (index) => Container(
              color: Colors.white,
              child: ProductCard(
                product: result[index],
                index: index,
                addToFavourite: addToFavourite,
              ),
            ),
          ),
        ),
      ),
    );
  }

  addToFavourite(int index) {
    setState(() {
      result[index].isfavourite = !result[index].isfavourite;
    });
  }
}
