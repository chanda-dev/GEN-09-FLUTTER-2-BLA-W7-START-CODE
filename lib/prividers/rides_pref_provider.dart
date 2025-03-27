import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride/ride_pref.dart';
import 'package:week_3_blabla_project/repository/ride_preferences_repository.dart';

class RidesPrefProvider extends ChangeNotifier {
  final RidePreferencesRepository repository;
  // current pref
  RidePreference? _currentPref;
  // past pref
  // constructor
  RidesPrefProvider({required this.repository});

  RidePreference? get currentPref {
    return _currentPref;
  }

  void setCurrentPreference(RidePreference ridePref) {
    if (_currentPref == ridePref) {
      return;
    }
    _currentPref = ridePref;
    // add only the ride pref that doesn't exist in repo
    if (!repository.getPastPreferences().contains(ridePref)) {
      repository.addPreference(ridePref);
    }
    notifyListeners();
  }

  List<RidePreference> preferenceHistory() {
    return repository.getPastPreferences().reversed.toList();
  }
}
