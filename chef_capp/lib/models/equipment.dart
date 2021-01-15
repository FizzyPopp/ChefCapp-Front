import 'package:chef_capp/index.dart';
part 'equipment.g.dart';

@JsonSerializable(explicitToJson: true)
class Equipment {
  final ID _id;
  final String _name;

  Equipment(ID id, String name) :
        this._id = id,
        this._name = name;

  ID get id => _id;

  String get name => _name;

  factory Equipment.fromJson(Map<String, dynamic> json) => _$EquipmentFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentToJson(this);
}