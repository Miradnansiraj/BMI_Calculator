import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/home_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  static const routeName = '/resultPage';
  @override
  Widget build(BuildContext context) {
    final DataExchanger args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Male: ' + args.isMale.toString(),
              style: labelTextStyle,
            ),
            Text(
              'Height: ' + args.height.toString(),
              style: labelTextStyle,
            ),
            Text(
              'Weight: ' + args.weight.toString(),
              style: labelTextStyle,
            ),
            Text(
              'Age: ' + args.age.toString(),
              style: labelTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
