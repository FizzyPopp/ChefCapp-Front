import 'package:chef_capp/index.dart';
import 'package:provider/provider.dart';

class RecipeHomePage extends StatelessWidget {
  RecipeHomePage() {
    ParentController.discoverController.genDummyLists();
  }

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider.value(
        value: ParentController.discoverController,
        child:
        Selector<DiscoverController, List<RecipeData>>(
            selector: (_, model) => model.custom,
            builder: (context, data, _) {
              return VerticalListBuilder(<Widget>[
                Selector<DiscoverController, List<RecipeCollectionData>>(
                    selector: (_, model) => model.hero,
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
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) => DiscoverFavorites()
                    ));
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
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) => DiscoverFavorites()
                    ));
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
                ),
                ...(data.map((rd) => rd.toMiniCard(context)).toList())
              ]);
            }
        ),
      );
  }
}
