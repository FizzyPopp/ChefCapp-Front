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
    (json['allergyIngredients'] as List)
        ?.map((e) => e == null ? null : ID.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['allergyCategories'] as List)?.map((e) => e as String)?.toList(),
    (json['dietaryIngredients'] as List)
        ?.map((e) => e == null ? null : ID.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['dietaryCategories'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PreferencesToJson(Preferences instance) =>
    <String, dynamic>{
      'metricVolume': instance.metricVolume,
      'metricWeight': instance.metricWeight,
      'metricTemperature': instance.metricTemperature,
      'allergyIngredients':
          instance.allergyIngredients?.map((e) => e?.toJson())?.toList(),
      'allergyCategories': instance.allergyCategories,
      'dietaryIngredients':
          instance.dietaryIngredients?.map((e) => e?.toJson())?.toList(),
      'dietaryCategories': instance.dietaryCategories,
    };
