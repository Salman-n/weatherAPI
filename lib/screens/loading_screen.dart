import 'package:flutter/material.dart';
import 'package:weath/services/networking.dart';
import 'package:weath/services/location.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weath/services/weather.dart';



const apiKey = '0354c8e5ba9d01582891dae3cd117d76';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0.0;
  double longitude = 0.0;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
  var weatherData = await WeatherModel().getLocationWeather();

  if (!mounted) return;
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LocationScreen(
        locationWeather: weatherData,
      ),
    ),
  );
}

 @override
Widget build(BuildContext context) {
  return const Scaffold(
    body: Center(
      child: SpinKitFoldingCube(
        color: Colors.white,
      ),
    ),
  );
}
}