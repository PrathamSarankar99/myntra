import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListDisplay extends StatefulWidget {
  const ListDisplay(
      {Key? key,
      this.title = '',
      this.capitalizeTitle = false,
      this.urlList = const []})
      : super(key: key);
  final String title;
  final bool capitalizeTitle;
  final List<String> urlList;
  @override
  _ListDisplayState createState() => _ListDisplayState();
}

class _ListDisplayState extends State<ListDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          if (widget.title.isNotEmpty)
            Container(
              height: 50,
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: 20),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  widget.capitalizeTitle
                      ? widget.title.toUpperCase()
                      : widget.title,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    color: Colors.black.withOpacity(0.70),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          if (widget.urlList.isNotEmpty)
            Container(
              height: 250,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 20),
                scrollDirection: Axis.horizontal,
                itemCount: widget.urlList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 250,
                    width: 270,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(widget.urlList[index]),
                      ),
                    ),
                    child: TextButton(onPressed: () {}, child: Container()),
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}
