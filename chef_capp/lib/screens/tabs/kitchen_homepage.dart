import 'package:chef_capp/index.dart';
import 'package:provider/provider.dart';

class KitchenHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider.value(
        value: ParentController.inventory,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => IngredientAdder()
              ));
            },
          ),
          body: Consumer<InventoryController>(
            // don't need to rebuild search TextField every time
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: xMargins, vertical: gutters / 2),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search ingredients...',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (String s) {
                    ParentController.inventory.search(s);
                  },
                ),
              ),
              builder: (context, data, child) {
                return VerticalListBuilder(
                    [
                      child,
                      ...parseInventory(context, ParentController.inventory.forDisplay),
                    ]
                );
              }
          ),
        ),
    );
  }

  List<Widget> parseInventory(context, Map<String, List<IngredientInterface>> m) {
    List<Widget> out = [];
    m.forEach((String category, List<IngredientInterface> rows) {
      List<KitchenRow> tmp = [];
      rows.forEach((IngredientInterface ingredient) {
        tmp.add(KitchenRow(
          ingredientText: ingredient.name,
          amount: ingredient.amount,
          onTap: () {
            ParentController.inventory.onTap(context, ingredient.id);
          } // call the parent controller with this ingredient
        ));
      });
      out.add(KitchenAccordion(
        title: category,
        widgetList: tmp,
      ));
    });
    return out;
  }
}

class KitchenAccordion extends StatelessWidget {
  final List<Widget> widgetList;
  final String title;

  KitchenAccordion({
    @required this.widgetList,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: ExpansionTile(
        title: Text(title),
        children: widgetList,
      ),
    );
  }
}