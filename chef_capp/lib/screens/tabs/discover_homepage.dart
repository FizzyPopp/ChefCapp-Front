import 'package:chef_capp/index.dart';
import 'package:provider/provider.dart';

class RecipeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider.value(
        value: ParentController.discover,
        child:
        Selector<DiscoverController, List<RecipeData>>(
            selector: (_, model) => model.custom,
            builder: (context, data, _) {
              return VerticalListBuilder(<Widget>[
                /*
                Selector<DiscoverController, List<RecipeCollectionData>>(
                    selector: (_, model) => model.collections,
                    builder: (context, data, _) {
                      return HorizontalListBuilder(
                        height: cardRowHeight(context, heroCardHeight(context)),
                        widgetList: data.map((rcd) => rcd.toHeroCard(context)).toList(),
                      );
                    }
                ),
                ButtonRow(
                  headingText: 'My History',
                  interactionText: 'SEE ALL',
                  onTap: (){
                    ParentController.discover.discoverHistory(context);
                  },
                ),
                Selector<DiscoverController, List<RecipeData>>(
                    selector: (_, model) => model.recent,
                    builder: (context, data, _) {
                      return HorizontalListBuilder(
                        height: cardRowHeight(context, miniCardHeight(context)),
                        widgetList: data.map((rd) => rd.toMiniCard(context)).toList(),
                      );
                    }
                ),
                ButtonRow(
                  headingText: 'My Favorites',
                  interactionText: 'SEE ALL',
                  onTap: (){
                    ParentController.discover.discoverFavorites(context);
                  },
                ),
                Selector<DiscoverController, List<RecipeData>>(
                    selector: (_, model) => model.favorite,
                    builder: (context, data, _) {
                      return HorizontalListBuilder(
                        height: cardRowHeight(context, miniCardHeight(context)),
                        widgetList: data.map((rd) => rd.toMiniCard(context)).toList(),
                      );
                    }
                ),*/
                ...(data.map((rd) => rd.toFullCard(context)).toList())
              ]);
            }
        ),
      );
  }
}
