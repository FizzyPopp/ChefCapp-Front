// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeStep _$RecipeStepFromJson(Map<String, dynamic> json) {
  return RecipeStep(
    json['id'] == null ? null : ID.fromJson(json['id'] as Map<String, dynamic>),
    json['previous'] == null
        ? null
        : ID.fromJson(json['previous'] as Map<String, dynamic>),
    json['next'] == null
        ? null
        : ID.fromJson(json['next'] as Map<String, dynamic>),
    (json['chips'] as List)?.map((e) => e as String)?.toList(),
    (json['description'] as List)
        ?.map((e) =>
            e == null ? null : DescPart.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RecipeStepToJson(RecipeStep instance) =>
    <String, dynamic>{
      'id': instance.id?.toJson(),
      'previous': instance.previous?.toJson(),
      'next': instance.next?.toJson(),
      'chips': instance.chips,
      'description': instance.description?.map((e) => e?.toJson())?.toList(),
    };
