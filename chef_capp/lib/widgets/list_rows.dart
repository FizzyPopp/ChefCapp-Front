import 'package:chef_capp/index.dart';
import 'package:chef_capp/styles/icons.dart';
import 'package:flutter/cupertino.dart';

class ButtonRow extends StatelessWidget {
  final String headingText;
  final String interactionText;
  final Function onTap;

  ButtonRow({
    this.headingText,
    this.interactionText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: xMargins),
        height: 48.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              headingText,
              style: Theme.of(context).textTheme.headline5,
            ),
            Row(
              children: <Widget>[
                Text(
                  interactionText,
                  style: Theme.of(context).textTheme.button,
                ),
                Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).textTheme.button.color,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IngredientRow extends StatelessWidget {
  final Ingredient ingredient;
  String _quantity;
  String _name;
  bool _available;

  IngredientRow(@required this.ingredient) {
    this._quantity = ingredient.amount;
    this._name = ingredient.name;
    this._available = true;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: xMargins,
          vertical: gutters / 2,
        ),
        child: Row(
          children: <Widget>[
            Jagers.ingredientIcon(this.ingredient),
            SizedBox(width: gutters,),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Quantity ",
                    ),
                    TextSpan(
                      text: "Ingredient",
                    ),
                  ]
                ),
              ),
            ),
            SizedBox(width: gutters,),
            Icon(
              Icons.chevron_right,
              size: 24,
              color: CCColors.greyscale40,
            ),
          ],
        ),
      ),
    );
  }
}


class OldIngredientRow extends StatelessWidget {
  final String quantity;
  final String ingredient;
  final bool available;

  OldIngredientRow({
    @required this.quantity,
    @required this.ingredient,
    @required this.available,
  });

  Icon _icon() {
    if (available) {
      return Icon(
        Icons.check_circle,
        color: Colors.green,
      );
    } else {
      return Icon(
        Icons.remove_circle,
        color: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: xMargins,
        vertical: gutters / 2,
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 60.0,
            child: Text(quantity,),
          ),
          Expanded(
            child: Text(ingredient,),
          ),
          _icon(),
        ],
      ),
    );
  }
}

class StepRow extends StatelessWidget {
  final int step;
  final String directions;

  StepRow({
    @required this.step,
    @required this.directions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: xMargins,
        vertical: gutters / 2,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 60.0,
            child: AutoSizeText(
              "Step " + step.toString(),
              maxLines: 2,
              minFontSize: Theme.of(context).textTheme.bodyText2.fontSize,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            child: AutoSizeText(
              directions,
              maxLines: 2,
              minFontSize: Theme.of(context).textTheme.bodyText2.fontSize,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class KitchenRow extends StatelessWidget {
  final String ingredientText;
  final String amount;
  final Function onTap;

  KitchenRow({
    @required this.ingredientText,
    @required this.amount,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(xMargins),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(ingredientText),
            Text(amount),
          ],
        ),
      ),
    );
  }
}
