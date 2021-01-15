import 'package:chef_capp/index.dart';
part 'tag.g.dart';

@JsonSerializable()
class Tag {
  final String _name;

  Tag(String name) :
        this._name = name;

  String get name => _name;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}