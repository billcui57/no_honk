import 'dart:math';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();
    loadAll();
    
  }

  void loadAll () async{
    await new Future.delayed(const Duration(seconds : 2));
    
    Navigator.pushReplacementNamed(context, '/home');
  }


  @override
  Widget build(BuildContext context) {
    AssetImage backgroundImage = AssetImage('assets/loadingscreen.png');

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image(image: backgroundImage),
            Text(
              'No Honk',
              style: TextStyle(
                color: Color(0xff1b1613),
                fontSize: 30,
                fontFamily: 'Pacifico',
              ),
            )
          ],
        ));
  }
}
