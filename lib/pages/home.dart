import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Random ran = new Random();
    int geeseDisplayIndex = ran.nextInt(4) + 1;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        textTheme: TextTheme(
                title: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Pacifico',
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
        title: Text('Main Menu'),
      ),
      body: Container(
        color: Color.fromRGBO(255, 234, 41,5),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/geese$geeseDisplayIndex.jpg',
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
               SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/map');
                    },
                    padding: Theme.of(context).buttonTheme.padding,
                    color: Theme.of(context).buttonColor,
                    child: Text(
                      'Geese Map',
                      style: Theme.of(context).textTheme.body1,
                      ),
                    ),
                ),
                
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/measurer');
                    },
                    padding: Theme.of(context).buttonTheme.padding,
                    color: Theme.of(context).buttonColor,
                    child: Text(
                      'Geese Aggression Measurer',
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
