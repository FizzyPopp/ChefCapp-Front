// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preferences _$PreferencesFromJson(Map<String, dynamic> json) {
  return Preferences(
    json['metricVolume'] as bool,
    json['metricWeight'] as bool,
    json['metricTemperature'] as bool,
    (json['allergies'] as List)?.map((e) => e as String)?.toList(),
    (json['dietaryRestrictions'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PreferencesToJson(Preferences instance) =>
    <String, dynamic>{
      'metricVolume': instance.metricVolume,
      'metricWeight': instance.metricWeight,
      'metricTemperature': instance.metricTemperature,
      'allergies': instance.allergies,
      'dietaryRestrictions': instance.dietaryRestrictions,
    };
