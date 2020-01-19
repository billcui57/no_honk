
import 'package:flutter/material.dart';
class Measurer extends StatefulWidget {
  @override
  _MeasurerState createState() => _MeasurerState();
}

class _MeasurerState extends State<Measurer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geese Aggression Measurer'),
        backgroundColor: Theme.of(context).appBarTheme.color,
        textTheme: TextTheme(
                title: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Pacifico',
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
      ),
      body: Text('data'),
    );
  }
}