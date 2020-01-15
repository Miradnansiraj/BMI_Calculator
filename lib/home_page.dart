import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender_card.dart';
import 'custom_card.dart';
import 'constants.dart';

enum Gender { Male, Female }
enum Operation { Increment, Decrement }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int height = 170;
  int age = 18;
  int weight = 80;
  bool isMale = false, isFemale = false;

  //Key needed to display SnackBar inside onPressed
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Center(child: Text(widget.title, textAlign: TextAlign.center)),
        elevation: 14,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            //The First row with gender selection.
            flex: 3,
            child: Row(
              //Male card
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectGender(Gender.Male);
                      });
                    },
                    child: CustomCard(
                      colour: _maleCardSelected(),
                      cardContent: GenderCardContent(
                        iconData: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  //Female card
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectGender(Gender.Female);
                      });
                    },
                    child: CustomCard(
                      colour: _femaleCardSelected(),
                      cardContent: GenderCardContent(
                        iconData: FontAwesomeIcons.venus,
                        label: 'Female',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              //Second row
              //Height Selection
              flex: 3,
              child: CustomCard(
                colour: activeCardColor,
                cardContent: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        'HEIGHT',
                        style: labelTextStyle,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: numberTextStyle,
                          ),
                          Text(
                            'CM',
                            style: labelTextStyle,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.floor();
                          });
                        },
                        min: 50,
                        max: 250,
                        inactiveColor: Color(0xFF8D8E98),
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
              //The row for weight and age
              flex: 3,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                      //Card for Weight
                      child: CustomCard(
                    colour: activeCardColor,
                    cardContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'WEIGHT (KG)',
                            style: labelTextStyle,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            weight.toString(),
                            style: numberTextStyle,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Center(
                                  child: IconButton(
                                    icon: Icon(Icons.remove),
                                    iconSize: 40,
                                    onPressed: () {
                                      setState(() {
                                        _weightChange(
                                            operation: Operation.Decrement);
                                      });
                                    },
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: IconButton(
                                    icon: Icon(Icons.add),
                                    iconSize: 40,
                                    onPressed: () {
                                      setState(() {
                                        _weightChange(
                                            operation: Operation.Increment);
                                      });
                                    },
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      //Card for Age
                      child: CustomCard(
                    colour: activeCardColor,
                    cardContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'AGE',
                            style: labelTextStyle,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            age.toString(),
                            style: numberTextStyle,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: IconButton(
                                  icon: Icon(Icons.remove),
                                  iconSize: 40,
                                  onPressed: () {
                                    setState(() {
                                      _ageChange(
                                          operation: Operation.Decrement);
                                    });
                                  },
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: Icon(Icons.add),
                                  iconSize: 40,
                                  onPressed: () {
                                    setState(() {
                                      _ageChange(
                                          operation: Operation.Increment);
                                    });
                                  },
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              )),
          Expanded(
              //The Calculate button
              child: Container(
            margin: EdgeInsets.fromLTRB(0, 8.0, 0, 0),
            color: Theme.of(context).accentColor,
            child: FlatButton(
              child: Center(
                child: Text(
                  'Calculate your BMI',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
                ),
              ),
              onPressed: () {
                if (isMale == isFemale) {
                  //Display error if gender isnt selected
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text(
                      'Please select a gender',
                      style: TextStyle(fontSize: 28, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    duration: Duration(seconds: 2),
                    backgroundColor: Theme.of(context).accentColor,
                  ));
                } else {
                  Navigator.pushNamed(context, ResultPage.routeName,
                      arguments: DataExchanger(isMale, height, weight, age));
                }
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          )),
        ],
      ),
    );
  }

  _selectGender(Gender gender) {
    setState(() {
      if (gender == Gender.Male) {
        isMale = true;
        isFemale = false;
      } else {
        isMale = false;
        isFemale = true;
      }
    });
  }

  Color _maleCardSelected() {
    if (isMale) return activeCardColor;
    return inactiveCardColor;
  }

  Color _femaleCardSelected() {
    if (isFemale) return activeCardColor;
    return inactiveCardColor;
  }

  _weightChange({@required Operation operation}) {
    if (operation == Operation.Increment) {
      weight < 650 ? weight++ : null;
    } else {
      weight > 2 ? weight-- : null;
    }
  }

  _ageChange({@required Operation operation}) {
    if (operation == Operation.Increment) {
      age < 150 ? age++ : null;
    } else {
      age > 1 ? age-- : null;
    }
  }
}

//Class used to exchange data between 2 screens
class DataExchanger {
  bool isMale;
  int height, weight, age;
  DataExchanger(this.isMale, this.height, this.weight, this.age);
}
