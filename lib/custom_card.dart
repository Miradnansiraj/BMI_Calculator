import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color colour;
  final Widget cardContent;
  const CustomCard({@required this.colour, this.cardContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: colour,
      ),
      child: cardContent,
    );
  }
}
