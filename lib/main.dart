import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myntra/functions/homepage_functions.dart';
import 'package:myntra/modals/discount.dart';
import 'package:myntra/services.dart/constants.dart';
import 'package:myntra/widgets/category.dart';
import 'package:myntra/widgets/sale.dart';

void main() {
  runApp(MyntraApp());
}

class MyntraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Myntra',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Myntra(),
    );
  }
}

class Myntra extends StatefulWidget {
  Myntra({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Myntra> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        actions: getCallToActions(),
        bottom: PreferredSize(
          child: Container(
              height: 85.0,
              child: ListView(
                padding: EdgeInsets.only(left: 15, top: 5),
                scrollDirection: Axis.horizontal,
                children: getCategories(),
              )),
          preferredSize: Size.fromHeight(85.0),
        ),
      ),
      body: ListView(
        children: [
          SaleWidget(
            deadLineTitle: 'SALE ENDS IN',
            deadLine: DateTime.now(),
            offer: 'Free Shipping For You Till Midnight.',
            offerImageURL:
                'https://www.pngall.com/wp-content/uploads/2016/07/Special-offer-Download-PNG.png',
            discounts: [
              Discount('',
                  '10% instant discount on kotak mahindra bank Credit and debit cards.'),
              Discount('',
                  '10% instant discount on ICICI bank Credit and debit cards.'),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> getCallToActions() {
    return homePageAppBarIcons
        .map(
          (e) => IconButton(
            onPressed: () {
              appBarCallback(e.type);
            },
            icon: Image.asset(
              e.path,
              width: 20,
            ),
          ),
        )
        .toList();
  }

  List<Widget> getCategories() {
    return categories.map((e) => CategoryWidget(title: e)).toList();
  }
}
