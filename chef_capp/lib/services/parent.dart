import 'package:chef_capp/index.dart';
import 'package:sqflite/sqflite.dart';

class ParentController with ChangeNotifier {
  static const int SEED = 2;
  /*
  - created on start up
  - all other controllers have access to it
  - dispatches all other controllers (ensures there's only ever one instance of the Discover controller, etc.)
  - most screens will need access to this controller, as they will ask it for other controllers
  - single universal source of truth
  */
  static User user;
  static _dbLocal = await openDatabase('cc_local.db');
//  static _dbChefCapp = await openDatabase('assets/chef_capp.db');
  init() {


  }
}
