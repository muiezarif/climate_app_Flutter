import 'package:geolocator/geolocator.dart';

class Location {
  double lat,lng;
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      lat=position.latitude;
      lng=position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
