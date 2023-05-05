// import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';   // Used for JSON decode (jsonDecode)
import 'package:intl/intl.dart'; //intl is used for showing date with too good order.

class WorldTime{

  String location='';// Location  name for that UI
  String time='';// the time in that Location
  String flag='';// url to an asset flag icon
  String url='';//location url for api endpoint 
  bool isDayTime = false;

  // WorldTime(String location, String flag, String url){
  //   this.location = location;
  //   this.flag = flag;
  //   this.url = url;
  // }
  WorldTime({ required this.location, required this.flag, required this.url });


  Future<void> getTime() async{
   
     try{
      // make the request
      // Response is given by http package and used for taking information from this request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDayTime = (now.hour > 6 && now.hour < 20 )? true : false;
      time = DateFormat.jm().format(now); // DateFormat is in intl and it'll show in proper pm and am
    }
    catch (e) {
      print(e); 
      time = 'could not get time';
    }
  }
}

