import 'package:flutter/material.dart';
import 'package:no_honk/pages/home.dart';
import 'package:no_honk/pages/loading.dart';
import 'package:no_honk/pages/map.dart';
import 'package:no_honk/pages/measurer.dart';


Color dominant_color = Color.fromRGBO(253, 213, 79, 1);

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/map': (context) => Map(),
        '/measurer': (context) => Measurer()
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: dominant_color,
        ),
        textTheme: TextTheme(
            body1: TextStyle(
                color: dominant_color,
                fontSize: 20,
                fontFamily: 'Pacifico')),
        buttonColor: Colors.black,
        buttonTheme: ButtonThemeData(
          padding: EdgeInsets.all(50),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              ),
        ),
        backgroundColor:  dominant_color,
        
      ),
    ));
