import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';

class NestLocation {
  String location; //location nme for the UI
  String time; //the time in that location
  String url; //location url for api endpoint
  bool isDayTime; //true if daytime
}
