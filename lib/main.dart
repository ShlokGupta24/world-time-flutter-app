import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/loading.dart';

void main() => runApp(
  MaterialApp(
    initialRoute: '/',
    // Giving routes easily access and use different pages in the app
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ),
);
