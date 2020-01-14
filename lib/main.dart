import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculato',
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff0A0D22),
          accentColor: Color(0xffFD0225),
          scaffoldBackgroundColor: Color(0xff0A0D22),
          sliderTheme: SliderThemeData(
            thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 16.0, disabledThumbRadius: 8.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
            thumbColor: Color(0xffFD0225),
            overlayColor: Color(0xffFD0225),
            activeTrackColor: Colors.white,
          )),
      home: MyHomePage(title: 'BMI Calculator'),
    );
  }
}
