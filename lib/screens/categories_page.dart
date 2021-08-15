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
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Theme(
                data: ThemeData(
                  dividerColor: Colors.white,
                ),
                child: ExpansionTile(
                  iconColor: Colors.black.withOpacity(0.7),
                  collapsedIconColor: Colors.black.withOpacity(0.7),
                  tilePadding: EdgeInsets.only(right: 20, left: 20),
                  backgroundColor: categories[index].backgroundColor,
                  collapsedBackgroundColor: categories[index].backgroundColor,
                  children: categories[index]
                      .subCategories
                      .map((e) => ExpansionTile(
                            title: Text(
                              e,
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                          ))
                      .toList(),
                  title: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              categories[index].title.toUpperCase(),
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                categories[index]
                                    .subCategories
                                    .toString()
                                    .substring(
                                        1,
                                        categories[index]
                                                .subCategories
                                                .toString()
                                                .length -
                                            1),
                                maxLines: 1,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (categories[index].imageURL.isEmpty)
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 100,
                            width: 20,
                          ),
                        ),
                      if (categories[index].imageURL.isNotEmpty)
                        Expanded(
                          flex: 4,
                          child: Container(
                            color: Colors.blue,
                            height: 100,
                            width: 50,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 2,
                thickness: 2,
                color: Colors.white,
              ),
            ],
          );
        },
      ),
    );
  }
}
