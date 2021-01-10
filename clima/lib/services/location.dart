import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      // return position;
    } catch (e) {
      print('exception is >> $e');
      // return Position(latitude: 0.0, longitude: 0.0);
    }
  }
}
