import 'package:flutter/material.dart';
import 'package:world_time/main.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String , dynamic> myData = {};
  @override
  Widget build(BuildContext context) {
   myData = myData.isNotEmpty ? myData : ModalRoute.of(context)!.settings.arguments as Map<String , dynamic >;
  print(myData);
  String bgImage = myData['isDayTime'] ? 'day.jpg' : 'night.jpg';
  Color bgColor = myData['isDayTime'] ? Colors.blueAccent : Colors.indigo;
//  Color txtColor = myData['isDayTime'] ? Colors.white : Colors.white  ;
   return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit:BoxFit.cover,

            ),


          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 240, 0, 0),
                child: ElevatedButton.icon(
                    onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      myData = {
                        'time' : result['time'],
                        'location' : result['location'],
                         'flag' : result['flag'],
                           'isDayTime' : result['isDayTime'],
                      };
                    });
                    },
                    icon: Icon(Icons.edit_location,color: Colors.grey[600],),
                    label: Text('edit location',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all (Colors.grey[200]),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(myData['location'],
                  style: TextStyle(
                    fontSize: 40.0,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              Text(myData['time'],
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.white,

              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
