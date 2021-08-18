import 'package:flutter/material.dart';
import 'package:myntra/modals/IconType.dart';
import 'package:myntra/services/constants.dart';
import 'package:myntra/widgets/product_card.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
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
            '75636 Items',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              iconMap[IconType.search] ?? '',
              width: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              iconMap[IconType.favourite] ?? '',
              width: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              iconMap[IconType.cart] ?? '',
              width: 20,
            ),
          ),
        ],
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
            100,
            (index) => Container(
              color: Colors.white,
              child: ProductCard(),
            ),
          ),
        ),
      ),
    );
  }
}
