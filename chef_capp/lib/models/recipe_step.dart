import 'package:chef_capp/index.dart';

class RecipeStep {
  final ID _id;
  // tempting to put a reference to the parent Recipe here, but don't think instantiation would work out with all these final fields
  final List<String> _chips;
  final List<DescPart> _description;
  RecipeStep(this._id, this._chips, this._description);
  ID get id => _id;
  List<String> get chips => [..._chips];
  List<DescPart> get description => [..._description];
}