import 'package:week_3_blabla_project/model/ride/ride_pref.dart';

class RidePreferencesDto {
  static Map<String, dynamic> toJson(RidePreference model) {
    return {
      'departure': model.departure,
      'departureDate': model.departureDate,
      'arrival': model.arrival,
      'seats': model.requestedSeats
    };
  }

  static RidePreference fromJson(Map<String, dynamic> json) {
    return RidePreference(
        departure: json['departure'],
        departureDate: json['departureDate'],
        arrival: json['arrival'],
        requestedSeats: json['seats']);
  }
}
