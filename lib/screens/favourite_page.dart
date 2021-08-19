import 'package:flutter/material.dart';
import 'package:myntra/modals/IconType.dart';
import 'package:myntra/modals/product.dart';
import 'package:myntra/screens/cart_page.dart';
import 'package:myntra/widgets/appbar_actions.dart';
import 'package:myntra/widgets/favourite_card.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleSpacing: 0,
        title: ListTile(
          title: Text(
            'Wishlist',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          subtitle: Text(
            dummyProducts
                    .where((element) => element.isfavourite)
                    .toList()
                    .length
                    .toString() +
                ' items',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ),
        actions: [
          AppBarAction(
              type: IconType.cart,
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            Cart()));
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 5.5 / 10,
          children: dummyProducts
              .where((element) => element.isfavourite)
              .toList()
              .map((e) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        border: Border.all(
                          color: Colors.black45,
                          width: 0.5,
                        )),
                    child: FavouriteCard(
                      product: e,
                      removeFavourite: removeFavourite,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  removeFavourite(Product product) {
    setState(() {
      product.isfavourite = false;
    });
  }
}
