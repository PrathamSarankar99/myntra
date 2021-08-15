import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageDisplay extends StatefulWidget {
  const PageDisplay({
    Key? key,
    this.urlList = const [],
    this.verticalMargin = 15,
    this.title = '',
    this.capitalizeTitle = false,
  }) : super(key: key);
  final List<String> urlList;
  final bool capitalizeTitle;
  final String title;
  final double verticalMargin;
  @override
  _PageDisplayState createState() => _PageDisplayState();
}

class _PageDisplayState extends State<PageDisplay> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: widget.verticalMargin),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return PageDisplayBanner(
                      imageURl: widget.urlList[index % widget.urlList.length]);
                },
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index % widget.urlList.length;
                  });
                },
              ),
            ),
          if (widget.urlList.length > 1)
            Container(
              height: 30,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.urlList.length,
                      (index) => Pointer(isActive: index == selectedIndex)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class PageDisplayBanner extends StatelessWidget {
  const PageDisplayBanner({Key? key, this.height = 270, required this.imageURl})
      : super(key: key);
  final double height;
  final String imageURl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              imageURl,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: TextButton(onPressed: () {}, child: Container()),
      ),
    );
  }
}

class Pointer extends StatelessWidget {
  const Pointer({Key? key, required this.isActive}) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      margin: EdgeInsets.only(right: 5),
      width: 6,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
