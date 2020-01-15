import 'package:bmi_calculator/brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/custom_card.dart';
import 'package:bmi_calculator/home_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  static const routeName = '/resultPage';
  @override
  Widget build(BuildContext context) {
    final DataExchanger args = ModalRoute.of(context).settings.arguments;
    Brain brain = Brain(height: args.height, weight: args.weight);

    return Scaffold(
      appBar: AppBar(
        elevation: 14,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Center(
                child: Container(
                  child: Text(
                    'Your Result',
                    style: titleTextStyle,
                  ),
                ),
              )),
              Expanded(
                child: CustomCard(
                  colour: activeCardColor,
                  cardContent: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      brain.getText(),
                      Text(
                        brain.calculateBMI().toStringAsFixed(2),
                        style: resultNumberTextStyle,
                      ),
                      Text(
                        brain.getPara(),
                        style: paraTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                flex: 8,
              ),
              Expanded(
                  //The Calculate button
                  child: Container(
                margin: EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                color: Theme.of(context).accentColor,
                child: FlatButton(
                  child: Center(
                    child: Text(
                      'Calculate again',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
