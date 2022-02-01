import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class myDateTimeLocation{
  String location;  // location name for the ui
  String? time; // the time in that location
//  late String time;
  String flag; // url to asset flag icon
  String url; // location url for api endpoint
  bool? isDayTime; // use it ternory operator to show wether day or night

  myDateTimeLocation({required this.location , required this.flag , required this.url});

  
  Future<void> getEndPointDateTimeLocationDate() async {
    try{
      http.Response response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
//        print(response.body);
      Map myDateTime_data = jsonDecode(response.body);
//  print(myDateTime_data);
      // create string vars for date-time
      String datetime = myDateTime_data['datetime'];
      String utc_offset = myDateTime_data['utc_offset'].substring(1,3);
//    print(datetime);
//    print(utc_offset);
      // creates obj's for datetime
      DateTime myDateTimeFormatting = DateTime.parse(datetime);
      myDateTimeFormatting = myDateTimeFormatting.add(Duration(hours: int.parse(utc_offset))); //we add utc_offset to datetime by converting from string to int dataType
//    print(myDateTimeFormatting);
      isDayTime = myDateTimeFormatting.hour > 6 && myDateTimeFormatting.hour < 20 ? true : false;
      time = DateFormat.jm().format(myDateTimeFormatting);
//    print(time);
    }
    catch(e){
      print('detect_error $e');
//      time = 'show some data';
    }



  }

}
