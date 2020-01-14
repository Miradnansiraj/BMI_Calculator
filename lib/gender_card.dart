import 'package:flutter/material.dart';
import 'constants.dart';

class GenderCardContent extends StatelessWidget {
  final IconData iconData;
  final String label;
  const GenderCardContent({this.iconData, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxHeight * constraints.maxWidth <= 600)
              return Icon(
                iconData,
                color: Colors.white,
                size: 50,
              );
            return Icon(
              iconData,
              color: Colors.white,
              size: 60,
            );
          },
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          label,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
