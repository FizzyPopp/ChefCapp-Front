// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Equipment _$EquipmentFromJson(Map<String, dynamic> json) {
  return Equipment(
    json['id'] == null ? null : ID.fromJson(json['id'] as Map<String, dynamic>),
    json['name'] as String,
  );
}

Map<String, dynamic> _$EquipmentToJson(Equipment instance) => <String, dynamic>{
      'id': instance.id?.toJson(),
      'name': instance.name,
    };
