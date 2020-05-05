import 'package:chef_capp/index.dart';

double cardBreakpoint = 380.0;

double smallerCardTextAreaHeight = 182.0;
double smallerCardTextAreaWidth = 172.0;

double largerCardTextAreaHeight = 150.0;
double largerCardTextAreaWidth = 220.0;

double fullColumn(BuildContext context) {
  return screenWidth(context) - 2 * xMargins;
}

double halfColumn(BuildContext context) {
  return (screenWidth(context) - 2 * xMargins - gutters) / 2;
}

double cardTextAreaHeight(BuildContext context) {
  if (screenWidth(context) > cardBreakpoint) {
    return largerCardTextAreaHeight;
  } else {
    return smallerCardTextAreaHeight;
  }
}

double cardTextAreaWidth(BuildContext context) {
  if (screenWidth(context) > cardBreakpoint) {
    return largerCardTextAreaWidth;
  } else {
    return smallerCardTextAreaWidth;
  }
}

double miniCardHeight(BuildContext context) {
  return halfColumn(context) * 1.2;
}

double heroCardHeight(BuildContext context) {
  return fullColumn(context) * 0.8;
}

double cardRowHeight(BuildContext context, double targetHeight) {
  return targetHeight + cardMargins * 2;
}