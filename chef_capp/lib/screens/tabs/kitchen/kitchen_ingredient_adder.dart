import 'package:chef_capp/index.dart';

class IngredientAdder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GenericAppBar(appBarTitle: 'Add ingredients'),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: xMargins, vertical: gutters / 2),
              child: Wrap(
                alignment: WrapAlignment.start,
                //runAlignment: WrapAlignment.end,
                spacing: 4.0,
                runSpacing: 4.0,
                children: <Widget>[
                  IngredientAdderChip(
                    label: 'Ingredient',
                    isSelected: false,
                  ),
                ],
              ),
            ),
          ]
      ),
    );
  }
}

class IngredientAdderChip extends StatelessWidget {
  final bool isSelected;
  final String label;

  IngredientAdderChip({
    @required this.isSelected,
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        label,
      ),
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Theme.of(context).accentColor,
      ),
      backgroundColor: Colors.transparent,
      selectedColor: Theme.of(context).accentColor,
      checkmarkColor: Colors.white,
      shape: StadiumBorder(side: BorderSide(color: Theme.of(context).accentColor)),
      selected: isSelected,
      onSelected: (bool value) {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => IngredientAdjust(
              // TODO
              controller: IngredientController.empty(null),
            )
        ));
      },
    );
  }
}

