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
            controller: controller,
            onChanged: (value) {
              setState(() {});
            },
            onSubmitted: (value) {
              if (controller.text.isEmpty) {
                return;
              }
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
        actions: controller.text.isNotEmpty
            ? [
                IconButton(
                  onPressed: () {
                    controller.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
              ]
            : [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.camera_alt,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.mic),
                ),
              ],
      ),
    );
  }
}
