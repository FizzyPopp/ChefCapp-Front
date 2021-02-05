import 'package:chef_capp/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GradientButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final Gradient gradient;
  final bool enabled;
  final bool loading;


  Color splashColor () {
    if (!enabled || loading) {
      return Colors.transparent;
    } else {
      return Colors.black12;
    }
  }

  Gradient backgroundGradient () {
    Gradient _newGradient;
    List<Color> _newColors;

    if (enabled) {

      return gradient;

    } else if (_newGradient == null) {

      _newColors = new List(gradient.colors.length);
      //_newGradient = gradient;

      for (var i = 0; i < gradient.colors.length; i++) {
        _newColors[i] = HSLColor.fromColor(gradient.colors[i]).
        withSaturation(0.3).toColor();
      }

      _newGradient = LinearGradient(
        colors: _newColors,
      );

      return _newGradient;

    } else {
      return _newGradient;
    }
  }

  GradientButton({
    @required this.child,
    @required this.onPressed,
    @required this.gradient,
    this.enabled = true,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        gradient: backgroundGradient(),
        borderRadius: BorderRadius.circular(4.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      height: 48.0,
      duration: Duration(milliseconds: 400),
      child: MaterialButton(
        onPressed: enabled ? onPressed : null,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: AnimatedSwitcher(
            switchInCurve: Curves.easeInBack,
            duration: Duration(milliseconds: 400),
            child: !loading ? child : SpinKitThreeBounce(
              color: Colors.white,
              size: 18.0,
            ),
          ),
        ),
        splashColor: enabled ? Colors.black12 : null,
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)
        ),
      ),
    );
  }
}

