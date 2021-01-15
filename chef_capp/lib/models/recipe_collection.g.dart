// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeCollection _$RecipeCollectionFromJson(Map<String, dynamic> json) {
  return RecipeCollection(
    json['id'] == null ? null : ID.fromJson(json['id'] as Map<String, dynamic>),
    json['heading'] as String,
    json['title'] as String,
    (json['recipes'] as List)
        ?.map((e) =>
            e == null ? null : Recipe.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['imgURL'] as String,
  );
}

Map<String, dynamic> _$RecipeCollectionToJson(RecipeCollection instance) =>
    <String, dynamic>{
      'id': instance.id?.toJson(),
      'heading': instance.heading,
      'title': instance.title,
      'recipes': instance.recipes?.map((e) => e?.toJson())?.toList(),
      'imgURL': instance.imgURL,
    };
