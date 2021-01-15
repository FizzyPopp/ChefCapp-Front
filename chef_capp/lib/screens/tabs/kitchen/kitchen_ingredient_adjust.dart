import 'package:chef_capp/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class IngredientAdjust extends StatelessWidget {
  final IngredientController controller;

  IngredientAdjust({
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: controller,
      child: Consumer<IngredientController>(
        builder: (context, data, _) {
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
                          controller.isExisting ?
                          'Would you like to change the quantity of ' +
                              controller.label.toLowerCase() + ' you have?' :
                          'How many ' + controller.label.toLowerCase() + ' would you like to add?',
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
                              value: controller.isEstimate,
                              onChanged: (newVal) { controller.onEstimateChanged(newVal); },
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
                          controller.isExisting ? 'SAVE MY QUANTITY' : 'ADD TO KITCHEN',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () { controller.onConfirm(context); },
                      ),
                      controller.isExisting ? OutlineButton(
                        borderSide: BorderSide(color: Colors.red[600]),
                        highlightColor: Colors.red[100],
                        highlightedBorderColor: Colors.red[900],
                        child: Text(
                          'REMOVE FROM KITCHEN',
                          style: TextStyle(color: Colors.red[600]),
                        ),
                        onPressed: () { controller.onDelete(context); },
                      ) : SizedBox(height: 0,),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      )
    );
  }
}
