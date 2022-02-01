import 'package:flutter/material.dart';
import 'package:world_time/services/world_dateTime.dart';
import 'package:world_time/pages/loadingPage.dart';

class myChoosingLocation extends StatefulWidget {
  @override
  _myChoosingLocationState createState() => _myChoosingLocationState();
}

class _myChoosingLocationState extends State<myChoosingLocation> {
List<myDateTimeLocation> theCountriesLocations = [
  myDateTimeLocation(location: 'London',flag: 'london.jpg',url: 'Europe/London'),
  myDateTimeLocation(location: 'Berlin', flag: 'germany.jpg', url: 'Europe/Berlin'),
  myDateTimeLocation(location: 'Nairobi', flag: 'kenya.jpg', url: 'Africa/Nairobi'),
  myDateTimeLocation(location: 'Jakarta', flag: 'jakarta.jpg', url: 'Asia/Jakarta'),
  myDateTimeLocation(location: 'Cairo', flag: 'cairo.jpg', url: 'Africa/Cairo'),
  myDateTimeLocation(location: 'Seoul', flag: 'seol.jpg', url: 'Asia/Seoul'),
  myDateTimeLocation(location: 'Chicago', flag: 'chicago.jpg', url: 'America/Chicago'),
  myDateTimeLocation(location: 'New_York', flag: 'new_york.jpg', url: 'America/New_York'),
  myDateTimeLocation(location: 'Accra', flag: 'sumalia.jpg', url: 'Africa/Accra'),

];

void upDateTime(index) async {
  myDateTimeLocation newLocationInstance = theCountriesLocations[index];
 await newLocationInstance.getEndPointDateTimeLocationDate();
 // navigate to home screen
  Navigator.pop(context,{
    'location' : newLocationInstance.location,
    'flag' : newLocationInstance.flag,
    'time' : newLocationInstance.time,
    'isDayTime' : newLocationInstance.isDayTime,
  });
}

  //  void get() async {
//   String myName = await Future.delayed(Duration(seconds:2),(){
//      return 'hey its me zia your husband';
//    });
//  String myWife =  await  Future.delayed(Duration(seconds: 1),() {
//    return 'hey its me shifa rehman your wife';
//    });
//    print('$myName - $myWife');
//  }
//  int incementNum = 0;
//  @override
//  void initState() {
//    super.initState();
//     get();
//    print('initState is now run');
//  }




  @override
  Widget build(BuildContext context) {
//    print('build is now run');
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text('choose location',
        style: TextStyle(
          letterSpacing: 1.0,
        ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: theCountriesLocations.length,
          itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0 , horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () => upDateTime(index),
                title: Text(theCountriesLocations[index].location),
                leading: CircleAvatar(
                  backgroundImage:AssetImage('assets/${theCountriesLocations[index].flag}') ,

                ),
              ),
            ),
          );
          },
      )
    );
  }
}
