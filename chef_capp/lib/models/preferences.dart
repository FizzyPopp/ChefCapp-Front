import 'package:chef_capp/index.dart';
part 'preferences.g.dart';

@JsonSerializable(explicitToJson: true)
class Preferences {
  bool metricVolume;
  bool metricWeight;
  bool metricTemperature;
  List<String> allergies;
  List<String> dietaryRestrictions;

  // 3 screens: units, allergies, dietary
  // one model for all three
  // one controller for all three, doesn't matter is user is logged in or out

  Preferences.localized() {
    // for default prefs:
    // import 'package:flutter_localizations/flutter_localizations.dart';
    // Locale myLocale = Localizations.localeOf(context);
    // below is just for testing
    this.metricVolume = true;
    this.metricWeight = true;
    this.metricTemperature = true;
    this.allergies = ["goose"];
    this.dietaryRestrictions = ["pesca-pescatarian"];
  }

  Preferences(bool metricVolume, bool metricWeight, bool metricTemperature, List<String> allergies, List<String> dietaryRestrictions) :
        this.metricVolume = metricVolume,
        this.metricWeight = metricWeight,
        this.metricTemperature = metricTemperature,
        this.allergies = [...allergies],
        this.dietaryRestrictions = [...dietaryRestrictions];

  Preferences copy() {
    return Preferences.fromJson(this.toJson());
  }

  factory Preferences.fromJson(Map<String, dynamic> json) => _$PreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$PreferencesToJson(this);

  static Preferences fromDB(data) {
    return Preferences(
      data["metricVolume"] ?? true,
      data["metricWeight"] ?? true,
      data["metricTemperature"] ?? true,
      List<String>.from(data["allergies"]) ?? [],
      List<String>.from(data["dietaryRestrictions"]) ?? []
    );
  }
}