import 'package:chef_capp/index.dart';

class KitchenHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VerticalListBuilder(
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
              amount: "300-400gr",
              onTap: () {
              },
            ),
            KitchenRow(
              ingredientText: 'Ingredient',
              amount: "2-4",
              onTap: () {
              },
            ),
          ],
        ),
        KitchenAccordion(
          title: 'Category',
          widgetList: <Widget>[
            KitchenRow(
              ingredientText: 'Ingredient',
              amount: "200-250ml",
              onTap: () {
              },
            ),
            KitchenRow(
              ingredientText: 'Ingredient',
              amount: "25-28",
              onTap: () {
              },
            ),
          ],
        ),
      ]
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