import 'package:chef_capp/index.dart';
import 'package:provider/provider.dart';

// CURRENTLY UNUSED
class DiscoverFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ParentController.discover,
      child: Scaffold(
          appBar: GenericAppBar(
            appBarTitle: 'My Favorites',
          ),
          body: Selector<DiscoverController, List<RecipeData>>(
              selector: (_, model) => model.favorite,
              builder: (context, data, _) {
                return VerticalListBuilder(data.map((rd) => rd.toFullCard(context)).toList());
              }
          )
      ),
    );
  }
}
