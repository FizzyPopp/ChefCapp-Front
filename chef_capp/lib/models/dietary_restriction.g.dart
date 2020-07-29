// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dietary_restriction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DietaryRestriction _$DietaryRestrictionFromJson(Map<String, dynamic> json) {
  return DietaryRestriction(
    json['id'] == null ? null : ID.fromJson(json['id'] as Map<String, dynamic>),
    json['name'] as String,
  );
}

Map<String, dynamic> _$DietaryRestrictionToJson(DietaryRestriction instance) =>
    <String, dynamic>{
      'id': instance.id?.toJson(),
      'name': instance.name,
    };
