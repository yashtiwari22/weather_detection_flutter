import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 0;
  double longitude = 0;

  Future<void> getCurrentPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;

      // print(latitude);
      // print(longitude);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
