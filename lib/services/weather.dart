import 'package:climateapp/services/location.dart';
import 'package:climateapp/services/networking.dart';

const apiKey="811544b7c71b11fe313183db0d5b54ba";
const openWeatherMapUrl="https://api.openweathermap.org/data/2.5/weather";
class WeatherModel {

  Future<dynamic> getCityWeather(String city) async{
    NetworkHelper helper=NetworkHelper("$openWeatherMapUrl?q=$city&appid=$apiKey&units=metric");
    var data=await helper.getWeatherData();
    return data;
  }

  Future<dynamic> getLocation() async{
    Location location=Location();
    await location.getCurrentLocation();

    NetworkHelper helper=NetworkHelper("$openWeatherMapUrl?lat=${location.lat}&lon=${location.lng}&appid=$apiKey&units=metric");
    var data=await helper.getWeatherData();
    return data;
//    Navigator.push(context,MaterialPageRoute(builder: (context){
//      return LocationScreen(locationWeather: data,);
//    }));
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
