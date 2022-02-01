import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loadingPage.dart';
import 'package:world_time/pages/choosingLocations.dart';

void main() =>
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => myLoadingScreen(),
      '/home' : (context) => Home(),
      '/location' : (context) => myChoosingLocation(),
    },
  ));


