import 'package:flutter/material.dart';
import 'dart:convert'; 
// import 'package:world_time/pages/loading.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {
    
    var parameters = ModalRoute.of(context)!.settings.arguments;
    // data = jsonDecode(jsonEncode(parameters));
    data = data.isNotEmpty ? data : jsonDecode(jsonEncode(parameters));
    
    //set background Image
    String bgImage = data['isDayTime'] ?'day.png' : 'night.png';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700] ;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover, //It means , it'll cover full screen size of image. 
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    if(result != null){
                      setState(() {
                        data = {
                          'time' : result['time'],
                          'location' : result['location'],
                          'isDayTime' : result['isDayTime'],
                          'flag' : result['flag'],
                        };
                      });
                    }
                  }, 
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                    ), 
                  label: Text(
                    "Edit Location",
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: const TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    ),
                  )
              ],
            ),
          ),
        ),
      ), // SafeArea widget is used for printing text in safe area .
    );
  }
} 