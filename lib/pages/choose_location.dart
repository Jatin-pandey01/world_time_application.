import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

   List<WorldTime> locations = [
	    WorldTime(location:'Athens' , flag:'greece.png' ,url: 'Europe/Athens'),
	    WorldTime(location:'Cairo' ,flag: 'egypt.png' ,url: 'Africa/Cairo'),
	    WorldTime(location:'Chicago' ,flag: 'usa.png' ,url: 'America/Chicago'),
      WorldTime(location:'Delhi', flag: 'india.png', url: 'Asia/Kolkata'),
      WorldTime(location:'Dubai', flag: 'uae.png', url: 'Asia/Dubai'),
	    WorldTime(location:'Jakarta' ,flag: 'indonesia.png' ,url: 'Asia/Jakarta'),
	    WorldTime(location:'Nairobi' ,flag: 'kenya.png' ,url: 'Africa/Nairobi'),
	    WorldTime(location:'New York' ,flag: 'usa.png' ,url: 'America/New_York'),
	    WorldTime(location:'London' ,flag: 'uk.png' ,url: 'Europe/London'),
      WorldTime(location:'Singapore', flag: 'singapore.png', url: 'Asia/Singapore'),
	    WorldTime(location:'Seoul' ,flag: 'south_korea.png' ,url: 'Asia/Seoul'),
	  ];

    void updateTime(index) async{
      WorldTime instance = locations[index];
      await instance.getTime();
      //Navigate to home screen
      Navigator.pop(context,{
        'location' : instance.location,
        'flag' : instance.flag,
        'time' : instance.time,
        'isDayTime' : instance.isDayTime,
      });
    }

    @override
    void initState(){
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){ // It is necessary / compulsory function for Liistview.builder, it take 2 parameter,context and index 
          return Padding(
            // height: 100,
            padding: const  EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(   // It's like card widget but left side have image and after that you can write Name of that location 
                onTap: (){
                  updateTime(index);
                  // print(locations[index].location) ;
                  // print(locations[index].time);
                },
                title: Text(
                  locations[index].location
                  // style: TextStyle(fontSize: 25),
                  ),
                leading: CircleAvatar( //This propery is in ListTile used for images in a same card
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                      // radius: 25,
                ),
              ),
            ),
          );
        } 
      ),
    );
  }
}