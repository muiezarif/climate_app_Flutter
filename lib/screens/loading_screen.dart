
import 'package:climateapp/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:climateapp/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
  }
 void getLocation() async{
    WeatherModel model=WeatherModel();
    var data= await model.getLocation();
    Navigator.push(context,MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: data,);
    }));
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 100.0,
//          controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
        )
      ),
    );
  }
}