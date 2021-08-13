import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myntra/functions/homepage_functions.dart';
import 'package:myntra/services.dart/constants.dart';
import 'package:myntra/widgets/myntra_navigation_bar.dart';
import 'package:myntra/widgets/category.dart';
import 'package:myntra/widgets/page_display.dart';

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
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = 0;
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(),
      bottomNavigationBar: MyntraNavigationBar(
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
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
        shrinkWrap: true,
        children: [
          PageDisplay(
            urlList: [
              'https://offerground.com/wp-content/uploads/2021/06/screenshot-www.myntra.com-2021.06.09-11_08_20.jpg',
              'https://paisebachaoindia.com/wp-content/uploads/2016/06/139.png',
              'https://paisebachaoindia.com/wp-content/uploads/2016/12/141.png',
              'https://paisebachaoindia.com/wp-content/uploads/2016/06/314.png',
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
