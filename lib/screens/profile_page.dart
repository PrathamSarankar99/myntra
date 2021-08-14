import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myntra/widgets/myntra_navigation_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        leadingWidth: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      bottomNavigationBar: MyntraNavigationBar(index: 2),
      body: ListView(
        children: [
          Container(
            height: 185,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.blueGrey.shade500,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 15,
                  left: 20,
                  right: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Material(
                        elevation: 2,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              )),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.08),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  )),
                              child: Icon(
                                CupertinoIcons.person,
                                size: 70,
                                color: Colors.black54,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.black12),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            )),
                            minimumSize: MaterialStateProperty.all(Size(
                                MediaQuery.of(context).size.width * 0.7 - 60,
                                45))),
                        child: Text("LOG IN/SIGN UP",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.transparent,
                child: Icon(
                  CupertinoIcons.gift,
                  size: 25,
                  color: Colors.black.withOpacity(0.60),
                ),
              ),
              horizontalTitleGap: 10,
              tileColor: Colors.white,
              title: Text(
                'Orders',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Check your order status',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              enableFeedback: true,
              onTap: () {},
            ),
          ),
          Divider(
            height: 0.5,
            thickness: 0.5,
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
              child: Icon(
                CupertinoIcons.heart,
                size: 25,
                color: Colors.black.withOpacity(0.60),
              ),
            ),
            horizontalTitleGap: 10,
            tileColor: Colors.white,
            title: Text(
              'Wishlist',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              'Your most loved styles',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            enableFeedback: true,
            onTap: () {},
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: ListTile(
                onTap: () {},
                tileColor: Colors.white,
                leading: Container(
                  width: 5,
                ),
                horizontalTitleGap: 10,
                title: Text(
                  'FAQs',
                  style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                )),
          ),
          Divider(
            height: 0.5,
            thickness: 0.5,
          ),
          ListTile(
              tileColor: Colors.white,
              onTap: () {},
              leading: Container(
                width: 5,
              ),
              horizontalTitleGap: 10,
              title: Text(
                'About us',
                style: GoogleFonts.poppins(
                  color: Colors.black54,
                  fontSize: 15,
                ),
              )),
          Divider(
            height: 0.5,
            thickness: 0.5,
          ),
          ListTile(
              onTap: () {},
              tileColor: Colors.white,
              leading: Container(
                width: 5,
              ),
              horizontalTitleGap: 10,
              title: Text(
                'Terms of use',
                style: GoogleFonts.poppins(
                  color: Colors.black54,
                  fontSize: 15,
                ),
              )),
          Divider(
            height: 0.5,
            thickness: 0.5,
          ),
          ListTile(
              onTap: () {},
              tileColor: Colors.white,
              leading: Container(
                width: 5,
              ),
              horizontalTitleGap: 10,
              title: Text(
                'Privacy Policy',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: 40,
              right: 20,
              bottom: 100,
              left: 20,
            ),
            child: Text(
              "APP VERSION 1.0.0",
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
          )
        ],
      ),
    );
  }
}
