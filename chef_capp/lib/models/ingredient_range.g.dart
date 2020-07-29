// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientRange _$IngredientRangeFromJson(Map<String, dynamic> json) {
  return IngredientRange(
    (json['range'] as List)?.map((e) => (e as num)?.toDouble())?.toList(),
    json['ingredient'] == null
        ? null
        : Ingredient.fromJson(json['ingredient'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IngredientRangeToJson(IngredientRange instance) =>
    <String, dynamic>{
      'range': instance.range,
      'ingredient': instance.ingredient?.toJson(),
    };
