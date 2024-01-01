import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart'; //Another way to import to packages


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,

  initialRoute: '/', //First route to load
  routes: {
    '/':(context) =>Loading(), //  '/': means base page which you will see first
    '/home':(context) => Home(),
    '/location':(context) => ChooseLocation(), 
  },
));