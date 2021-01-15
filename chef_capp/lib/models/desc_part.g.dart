// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'desc_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DescPart _$DescPartFromJson(Map<String, dynamic> json) {
  return DescPart(
    json['text'] as String,
    _$enumDecodeNullable(_$TextModEnumMap, json['style']),
  );
}

Map<String, dynamic> _$DescPartToJson(DescPart instance) => <String, dynamic>{
      'text': instance.text,
      'style': _$TextModEnumMap[instance.style],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$TextModEnumMap = {
  TextMod.copy: 'copy',
  TextMod.quantity: 'quantity',
  TextMod.unit: 'unit',
  TextMod.name: 'name',
};
