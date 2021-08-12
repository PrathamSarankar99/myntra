import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myntra/modals/discount.dart';

class SaleWidget extends StatefulWidget {
  const SaleWidget({
    Key? key,
    required this.deadLineTitle,
    required this.deadLine,
    this.offer = '',
    this.offerImageURL = '',
    this.discounts = const [],
  }) : super(key: key);
  final String deadLineTitle;
  final String offer;
  final String offerImageURL;
  final List<Discount> discounts;
  final DateTime deadLine;
  @override
  _SaleWidgetState createState() => _SaleWidgetState();
}

class _SaleWidgetState extends State<SaleWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 75,
          color: Colors.white,
          margin: EdgeInsets.only(top: 20, bottom: 20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.deadLineTitle,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * (0.35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SaleTimeColumn(),
                    SaleTimeColumn(),
                    SaleTimeColumn(),
                  ],
                ),
              )
            ],
          ),
        ),
        if (widget.offer.isNotEmpty)
          Container(
              height: 50,
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    child: Text(
                      widget.offer,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        color: Colors.black.withOpacity(0.60),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  if (widget.offerImageURL.isNotEmpty)
                    Image.network(
                      widget.offerImageURL,
                      height: 40,
                    )
                ],
              )),
        Container(
          height: 270,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey,
          child: Row(
            children: [
              Expanded(
                child: TextButton(onPressed: () {}, child: Container()),
              ),
              Expanded(
                child: TextButton(onPressed: () {}, child: Container()),
              ),
            ],
          ),
        ),
        Container(
          height: 50,
          color: Colors.white,
          margin: EdgeInsets.only(top: 20, bottom: 20),
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
              );
            },
          ),
        ),
      ],
    );
  }
}

class SaleTimeColumn extends StatelessWidget {
  const SaleTimeColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "24",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.red,
          ),
        ),
        Text(
          "hrs",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
