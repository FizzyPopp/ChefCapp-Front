import 'package:chef_capp/index.dart';

class KitchenHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => IngredientAdder()
          ));
        },
      ),
      body: VerticalListBuilder(
        [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: xMargins, vertical: gutters / 2),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search ingredients...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          KitchenAccordion(
            title: 'Category',
            widgetList: <Widget>[
              KitchenRow(
                ingredientText: 'Ingredient',
                ingredientUnit: 'gr',
                ingredientLowQty: 300,
                ingredientHighQty: 400,
                onTap: () {

                },
              ),
              KitchenRow(
                ingredientText: 'Ingredient',
                ingredientLowQty: 2,
                ingredientHighQty: 4,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => IngredientAdjust(
                        label: 'Ingredient',
                        isExisting: true,
                        onConfirm: () {
                          Navigator.pop(context);
                        },
                        onDelete: () {
                          Navigator.pop(context);
                        },
                      )
                  ));
                },
              ),
            ],
          ),
          KitchenAccordion(
            title: 'Category',
            widgetList: <Widget>[
              KitchenRow(
                ingredientText: 'Ingredient',
                ingredientUnit: 'ml',
                ingredientLowQty: 200,
                ingredientHighQty: 250,
                onTap: () {
                },
              ),
              KitchenRow(
                ingredientText: 'Ingredient',
                ingredientLowQty: 25,
                ingredientHighQty: 28,
                onTap: () {
                },
              ),
            ],
          ),
        ]
      ),
    );
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