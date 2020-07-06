import 'package:chef_capp/index.dart';
import 'package:provider/provider.dart';

// CURRENTLY UNUSED
class DiscoverHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ParentController.discover,
      child: Scaffold(
        appBar: GenericAppBar(
          appBarTitle: 'My History',
        ),
        body: Selector<DiscoverController, List<RecipeData>>(
            selector: (_, model) => model.recent,
            builder: (context, data, _) {
              return VerticalListBuilder(data.map((rd) => rd.toFullCard(context)).toList());
            }
        )
      ),
    );
  }
}
