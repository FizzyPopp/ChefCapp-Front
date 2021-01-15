// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return Ingredient(
    json['id'] == null ? null : ID.fromJson(json['id'] as Map<String, dynamic>),
    json['name'] as String,
    json['plural'] as String,
    (json['quantity'] as num)?.toDouble(),
    json['unit'] as String,
    json['category'] as String,
  );
}

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id?.toJson(),
      'name': instance.name,
      'plural': instance.plural,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'category': instance.category,
    };
