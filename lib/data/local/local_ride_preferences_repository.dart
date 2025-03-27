import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_3_blabla_project/data/dto/ride_preferences_dto.dart';
import 'package:week_3_blabla_project/data/repository/ride_preferences_repository.dart';
import 'package:week_3_blabla_project/model/ride/ride_pref.dart';

class LocalRidePreferencesRepository extends RidePreferencesRepository {
  static const String _preferencesKey = "ride_preferences";

  @override
  Future<void> addPreference(RidePreference preference) {
    // TODO: implement addPreference
    throw UnimplementedError();
  }

  Future<void> addPastPreference(RidePreference newPref) async {
    List<RidePreference> existingPref = await getPastPreferences();
    existingPref.add(newPref);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        _preferencesKey,
        existingPref
            .map((pref) => jsonEncode(RidePreferencesDto.toJson(pref)))
            .toList());
  }

  @override
  Future<List<RidePreference>> getPastPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> prefsList = prefs.getStringList(_preferencesKey) ?? [];
    return prefsList
        .map((json) => RidePreferencesDto.fromJson(jsonDecode(json)))
        .toList();
  }
}
