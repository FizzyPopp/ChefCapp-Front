// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipePreview _$RecipePreviewFromJson(Map<String, dynamic> json) {
  return RecipePreview(
    json['id'] == null ? null : ID.fromJson(json['id'] as Map<String, dynamic>),
    json['title'] as String,
    json['prepTime'] as int,
    json['cookTime'] as int,
    json['calories'] as int,
    (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['ingredients'] as List)
        ?.map((e) =>
            e == null ? null : Ingredient.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['cookware'] as List)
        ?.map((e) =>
            e == null ? null : Equipment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['componentIDs'] as List)?.map((e) => e as String)?.toList(),
    json['imgURL'] as String,
  );
}

Map<String, dynamic> _$RecipePreviewToJson(RecipePreview instance) =>
    <String, dynamic>{
      'id': instance.id?.toJson(),
      'title': instance.title,
      'prepTime': instance.prepTime,
      'cookTime': instance.cookTime,
      'calories': instance.calories,
      'tags': instance.tags?.map((e) => e?.toJson())?.toList(),
      'ingredients': instance.ingredients?.map((e) => e?.toJson())?.toList(),
      'cookware': instance.cookware?.map((e) => e?.toJson())?.toList(),
      'componentIDs': instance.componentIDs,
      'imgURL': instance.imgURL,
    };
