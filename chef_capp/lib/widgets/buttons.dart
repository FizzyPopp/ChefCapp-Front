import 'package:chef_capp/index.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final Gradient gradient;

  GradientButton({
    @required this.child,
    @required this.onPressed,
    @required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24.0),
          height: 48.0,
          child: child,
        ),
      ),
      splashColor: Colors.black12,
      padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0)
      ),
    );
  }
}


