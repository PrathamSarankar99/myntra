import 'package:flutter/material.dart';
import 'package:myntra/screens/result_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black.withOpacity(0.8),
        ),
        backgroundColor: Colors.white,
        titleSpacing: 0,
        elevation: 0,
        title: TextField(
            autofocus: true,
            controller: controller,
            onChanged: (value) {
              setState(() {});
            },
            onSubmitted: (value) {
              if (controller.text.isEmpty) {
                return;
              }
              Navigator.pop(context);
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return child;
                  },
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return ResultPage(
                      searchText: controller.text,
                    );
                  },
                ),
              );
            },
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for products',
                hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ))),
        actions: [
          IconButton(
            onPressed: () {
              controller.clear();
              Future.delayed(Duration(milliseconds: 200))
                  .then((value) => setState(() {}));
            },
            icon: Icon(Icons.clear),
          ),
        ],
      ),
      // body: Container(
      //     padding: EdgeInsets.only(),
      //     child: GridView.count(
      //       crossAxisCount: 2,
      //       mainAxisSpacing: 1.5,
      //       crossAxisSpacing: 1.5,
      //       childAspectRatio: 6 / 10,
      //       children: List.generate(
      //         result.length,
      //         (index) => Container(
      //           color: Colors.white,
      //           child: ProductCard(
      //             product: result[index],
      //             index: index,
      //             addToFavourite: addToFavourite,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
    );
  }
}
