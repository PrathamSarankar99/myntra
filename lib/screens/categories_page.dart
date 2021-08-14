import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myntra/functions/homepage_functions.dart';
import 'package:myntra/services/constants.dart';
import 'package:myntra/widgets/myntra_navigation_bar.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late List<bool> isExpandedList;

  @override
  void initState() {
    isExpandedList = categories.map((e) => false).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: getCallToActions(indexes: [3, 2]),
        leading: Container(),
        leadingWidth: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Categories',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      bottomNavigationBar: MyntraNavigationBar(
        index: 1,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: ExpansionPanelList(
            elevation: 0,
            animationDuration: Duration(
              milliseconds: 600,
            ),
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                isExpandedList[panelIndex] = !isExpanded;
              });
            },
            children: categories
                .map((e) => ExpansionPanel(
                      backgroundColor: Colors.white,
                      isExpanded: isExpandedList[categories.indexOf(e)],
                      headerBuilder: (context, isExpanded) {
                        return Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: ListTile(
                                title: Text(e.title),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: 80,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        );
                      },
                      body: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blue,
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
