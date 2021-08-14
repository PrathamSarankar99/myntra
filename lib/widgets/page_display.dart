import 'package:flutter/material.dart';

class PageDisplay extends StatefulWidget {
  const PageDisplay({
    Key? key,
    this.urlList = const [],
    this.verticalMargin = 15,
  }) : super(key: key);
  final List<String> urlList;
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
      margin: EdgeInsets.only(
          top: widget.verticalMargin, bottom: widget.verticalMargin),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.urlList.isNotEmpty)
            Container(
              height: 250,
              child: PageView(
                children: widget.urlList
                    .map((e) => PageDisplayBanner(
                          imageURl: e,
                        ))
                    .toList(),
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
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
