import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDisplay extends StatefulWidget {
  const GridDisplay(
      {Key? key,
      this.title = '',
      this.capitalizeTitle = false,
      this.urlList = const [],
      this.inRowCount = 3,
      this.horizontalPadding = 20,
      this.shape = BoxShape.rectangle,
      this.bgColor = Colors.white})
      : super(key: key);
  final String title;
  final bool capitalizeTitle;
  final double horizontalPadding;
  final Color bgColor;
  final int inRowCount;
  final List<String> urlList;
  final BoxShape shape;
  @override
  _GridDisplayState createState() => _GridDisplayState();
}

class _GridDisplayState extends State<GridDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bgColor,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          if (widget.title.isEmpty)
            Container(
              height: 20,
            ),
          if (widget.title.isNotEmpty)
            Container(
              height: 50,
              color: widget.bgColor,
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
            Wrap(
              children: widget.urlList
                  .map((e) => Container(
                        color: widget.bgColor,
                        padding: EdgeInsets.all(5),
                        height: (MediaQuery.of(context).size.width -
                                (widget.horizontalPadding * 2)) /
                            widget.inRowCount,
                        width: (MediaQuery.of(context).size.width -
                                (widget.horizontalPadding * 2)) /
                            widget.inRowCount,
                        child: widget.shape == BoxShape.circle
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(e),
                              )
                            : Image.network(
                                e,
                                fit: BoxFit.fill,
                              ),
                      ))
                  .toList(),
            )
        ],
      ),
    );
  }
}
