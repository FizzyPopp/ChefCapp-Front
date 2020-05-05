import 'package:chef_capp/index.dart';

// Gets size of device screen
Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

// Gets height of device from size
double screenHeight(BuildContext context) {
  return screenSize(context).height;
}

// Gets width of device from size
double screenWidth(BuildContext context) {
  return screenSize(context).width;
}

// Gets height of device from size
double oldScreenHeight(BuildContext context, {double dividedBy = 1}) {
  return screenSize(context).height / dividedBy;
}
// Gets width of device from size
double oldScreenWidth(BuildContext context, {double dividedBy = 1}) {
  return screenSize(context).width / dividedBy;
}