import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myntra/functions/homepage_functions.dart';
import 'package:myntra/widgets/deadline_widget.dart';
import 'package:myntra/widgets/drawer.dart';
import 'package:myntra/widgets/grid_display.dart';
import 'package:myntra/widgets/list_display.dart';
import 'package:myntra/widgets/myntra_navigation_bar.dart';
import 'package:myntra/widgets/offer_widget.dart';
import 'package:myntra/widgets/page_display.dart';
import 'package:myntra/widgets/quote_display.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GlobalKey<ScaffoldState> _scaffoldKey;
  late int selectedIndex;
  @override
  void initState() {
    _scaffoldKey = new GlobalKey<ScaffoldState>();
    selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: MyntraNavigationBar(
        index: 0,
      ),
      drawer: MyntraDrawer(),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
            return;
          },
          tooltip: 'Drawer',
        ),
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
                children: getTypes(),
              )),
          preferredSize: Size.fromHeight(85.0),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 20),
        shrinkWrap: true,
        children: [
          DeadLine(),
          Offer(),
          PageDisplay(
            title: 'Page Display',
            urlList: [
              'https://offerground.com/wp-content/uploads/2021/06/screenshot-www.myntra.com-2021.06.09-11_08_20.jpg',
              'https://paisebachaoindia.com/wp-content/uploads/2016/06/139.png',
              'https://paisebachaoindia.com/wp-content/uploads/2016/12/141.png',
              'https://paisebachaoindia.com/wp-content/uploads/2016/06/314.png',
            ],
          ),
          ListDisplay(
            title: 'List Display',
            urlList: [
              'https://offerground.com/wp-content/uploads/2021/06/screenshot-www.myntra.com-2021.06.09-11_08_20.jpg',
              'https://paisebachaoindia.com/wp-content/uploads/2016/06/139.png',
              'https://paisebachaoindia.com/wp-content/uploads/2016/12/141.png',
              'https://paisebachaoindia.com/wp-content/uploads/2016/06/314.png',
            ],
          ),
          GridDisplay(
            inRowCount: 3,
            title: 'Grid Display',
            horizontalPadding: 20,
            capitalizeTitle: false,
            urlList: [
              'https://offerground.com/wp-content/uploads/2021/06/screenshot-www.myntra.com-2021.06.09-11_08_20.jpg',
              'https://paisebachaoindia.com/wp-content/uploads/2016/06/314.png',
              'https://paisebachaoindia.com/wp-content/uploads/2016/12/141.png',
              'https://paisebachaoindia.com/wp-content/uploads/2016/06/139.png',
              'https://paisebachaoindia.com/wp-content/uploads/2016/12/141.png',
              'https://offerground.com/wp-content/uploads/2021/06/screenshot-www.myntra.com-2021.06.09-11_08_20.jpg',
              'https://paisebachaoindia.com/wp-content/uploads/2016/12/141.png',
              'https://offerground.com/wp-content/uploads/2021/06/screenshot-www.myntra.com-2021.06.09-11_08_20.jpg',
            ],
          ),
          QuoteDisplay(
            quote: 'In difficult time, fashion is always outrageous.',
            speaker: 'Elsa Schiaparelli',
          ),
        ],
      ),
    );
  }
}
