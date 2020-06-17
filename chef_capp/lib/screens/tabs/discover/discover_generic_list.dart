import 'package:chef_capp/index.dart';
import 'package:provider/provider.dart';

class DiscoverGenericList extends StatelessWidget {
  final String title;
  final Function metaSelector;

  DiscoverGenericList({
    @required this.title,
    @required this.metaSelector
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ParentController.discover,
      child: Scaffold(
          appBar: GenericAppBar(
            appBarTitle: title,
          ),
          body: Selector<DiscoverController, List<RecipeData>>(
              selector: (_, model) => metaSelector(model),
              builder: (context, data, _) {
                return VerticalListBuilder(data.map((rd) => rd.toFullCard(context)).toList());
              }
          )
      ),
    );
  }
}
