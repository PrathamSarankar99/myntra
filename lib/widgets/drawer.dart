import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyntraDrawer extends StatefulWidget {
  const MyntraDrawer({Key? key}) : super(key: key);

  @override
  _MyntraDrawerState createState() => _MyntraDrawerState();
}

class _MyntraDrawerState extends State<MyntraDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Container(
              color: Colors.blue,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 70,
                    width: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Icon(
                      CupertinoIcons.person,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              child: Text(
                                'Log in',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              height: 5,
                              width: 5,
                              margin: EdgeInsets.only(
                                left: 8,
                                right: 8,
                                bottom: 8,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                            InkWell(
                              child: Text(
                                'Sign up',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(
                            CupertinoIcons.chevron_right,
                            size: 20,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            minVerticalPadding: 20,
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.dashboard_rounded,
                size: 25,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            minLeadingWidth: 10,
            title: Text(
              'Shop by Categories',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.7),
                fontSize: 15,
              ),
            ),
            onTap: () {},
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          ListTile(
            minVerticalPadding: 20,
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                CupertinoIcons.gift_fill,
                size: 25,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            minLeadingWidth: 10,
            title: Text(
              'Orders',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.7),
                fontSize: 15,
              ),
            ),
            onTap: () {},
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          ListTile(
            minVerticalPadding: 5,
            leading: Container(width: 20),
            minLeadingWidth: 10,
            title: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'FAQs',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            minVerticalPadding: 5,
            leading: Container(width: 20),
            minLeadingWidth: 10,
            title: Text(
              'CONTACT US',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.7),
                fontSize: 14,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            minVerticalPadding: 5,
            leading: Container(width: 20),
            minLeadingWidth: 10,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                'LEGAL',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
