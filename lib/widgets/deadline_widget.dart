import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeadLine extends StatefulWidget {
  const DeadLine(
      {Key? key, this.title = 'SALE ENDS IN', this.capitalizeTitle = true})
      : super(key: key);
  final String title;
  final bool capitalizeTitle;
  @override
  _DeadLineState createState() => _DeadLineState();
}

class _DeadLineState extends State<DeadLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      color: Colors.white,
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
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
                SaleTimeColumn(
                  top: '20',
                  bottom: 'hrs',
                ),
                SaleTimeColumn(
                  top: '14',
                  bottom: 'mins',
                ),
                SaleTimeColumn(
                  top: '55',
                  bottom: 'sec',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SaleTimeColumn extends StatelessWidget {
  const SaleTimeColumn({Key? key, required this.top, required this.bottom})
      : super(key: key);
  final String top;
  final String bottom;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          top,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.red,
          ),
        ),
        Text(
          bottom,
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
