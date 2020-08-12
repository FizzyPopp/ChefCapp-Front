import 'package:chef_capp/index.dart';
import 'package:flutter/cupertino.dart';

class IngredientAdjust extends StatelessWidget {
  final String label;
  final bool isExisting;
  final Function onConfirm;
  final Function onDelete;

  IngredientAdjust({
    @required this.label,
    @required this.isExisting,
    @required this.onConfirm,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GenericAppBar(appBarTitle: 'Ingredient'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: xMargins, vertical: xMargins),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    isExisting ?
                    'Would you like to change the quantity of ' +
                        label.toLowerCase() + ' you have?' :
                    'How many ' + label.toLowerCase() + ' would you like to add?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: gutters,),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 200.0,
                          child: CupertinoPicker(
                            useMagnifier: true,
                            magnification: 1.32,
                            itemExtent: 42.0,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: gutters / 2),
                                child: Text('0'),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: gutters / 2),
                                child: Text('100'),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: gutters / 2),
                                child: Text('200'),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: gutters / 2),
                                child: Text('300'),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: gutters / 2),
                                child: Text('400'),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: gutters / 2),
                                child: Text('500'),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: gutters / 2),
                                child: Text('600'),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: gutters / 2),
                                child: Text('700'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 200.0,
                          child: CupertinoPicker(
                            useMagnifier: true,
                            magnification: 1.32,
                            itemExtent: 42.0,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: gutters / 2),
                                child: Text('gr'),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: gutters / 2),
                                child: Text('kg'),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: gutters / 2),
                                child: Text('oz'),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: gutters / 2),
                                child: Text('lb'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        value: false,
                        onChanged: null,
                      ),
                      Text('This is an estimate'),
                      SizedBox(width: xMargins,),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  color: Colors.green[600],
                  child: Text(
                    isExisting ? 'SAVE MY QUANTITY' : 'ADD TO KITCHEN',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: onConfirm,
                ),
                isExisting ? OutlineButton(
                  borderSide: BorderSide(color: Colors.red[600]),
                  highlightColor: Colors.red[100],
                  highlightedBorderColor: Colors.red[900],
                  child: Text(
                    'REMOVE FROM KITCHEN',
                    style: TextStyle(color: Colors.red[600]),
                  ),
                  onPressed: onDelete,
                ) : SizedBox(height: 0,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
