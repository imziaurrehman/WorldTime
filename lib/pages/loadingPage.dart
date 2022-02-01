import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/services/world_dateTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/pages/choosingLocations.dart';

class myLoadingScreen extends StatefulWidget {
  @override
  _myLoadingScreenState createState() => _myLoadingScreenState();
}

class _myLoadingScreenState extends State<myLoadingScreen> {
  @override
void gettingDateTime() async {
  myDateTimeLocation newLocationInstance   = myDateTimeLocation(location: 'berlin' , flag: 'germany.png' , url: 'Europe/berlin');
  await newLocationInstance.getEndPointDateTimeLocationDate();
  Navigator.pushReplacementNamed(context, '/home',arguments: {
    'location' : newLocationInstance.location,
    'flag' : newLocationInstance.flag,
    'time' : newLocationInstance.time,
    'isDayTime' : newLocationInstance.isDayTime,
  });





  //   print(newLocationInstance.time);
//   setState(() {
//     time = newLocationInstance.time;
//   });





  }


//void getTimeData() async {
// http.Response response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London'));
//     print(response.body);
//   Map myTimeInfo  = jsonDecode(response.body);
////   print(myTimeInfo);
//  // get properties from fetched data and storing them to string dataType
//String dateTime = myTimeInfo['datetime'];
//String offset = myTimeInfo['utc_offset'].substring(1,3);
////print(dateTime);
////print(offset);
//
//  // create dateTime obj
// DateTime currentTime = DateTime.parse(dateTime);
//currentTime = currentTime.add(Duration(hours: int.parse(offset)));
//print(currentTime);
//print(offset);
//
//}


  @override
  void initState() {
    super.initState();
//    getTimeData();
  gettingDateTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],

      body: Center(
          child: SpinKitCubeGrid(
            color: Colors.white,
            size: 50.0,
//            duration: Duration(milliseconds: 1200),
          ),
      ),
    );
  }
}
