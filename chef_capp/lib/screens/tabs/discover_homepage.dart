import 'package:chef_capp/index.dart';

class RecipeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VerticalListBuilder(dummyDiscoverHomepageList(context));
  }
}