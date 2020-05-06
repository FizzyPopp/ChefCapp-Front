import 'package:chef_capp/index.dart';

class PageData {
  final String title;
  final IconData icon;
  final Color bgColor;
  final Color textColor;

  PageData({
    this.title,
    this.icon,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
  });
}

List<Color> colors(BuildContext context) {
  return [
    Theme.of(context).primaryColor,
    Theme.of(context).accentColor,
  ];
}

class OverlayData {
  final String heading;
  final Widget content;
  final String buttonText;
  final bool lastPage;

  OverlayData({
    this.heading,
    this.content,
    this.buttonText,
    this.lastPage = false,
  });
}

class SignUp extends StatelessWidget {
  final List<OverlayData> overlays = [
    OverlayData(
      heading: 'First Page',
      content: Container(),
      buttonText: 'First Button',
    ),
    OverlayData(
      heading: 'Second Page',
      content: Container(),
      buttonText: 'Second Button',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ConcentricPageView(
          colors: colors(context),
          opacityFactor: 1.0,
          scaleFactor: 0,
          radius: 200,
          curve: Curves.ease,
          duration: Duration(seconds: 1),
          verticalPosition: 0.8,
          direction: Axis.horizontal,
          itemCount: overlays.length,
          //physics: NeverScrollableScrollPhysics(),
          itemBuilder: (index, value) {
            OverlayData overlay = overlays[index % overlays.length];
            // For example scale or transform some widget by [value] param
            //            double scale = (1 - (value.abs() * 0.4)).clamp(0.0, 1.0);
            return Container(
              child: PageOverlay(overlay: overlay),
            );
          },
        ),
      ),
    );
  }
}

class OldSignUp extends StatelessWidget {
  final List<PageData> pages = [
    PageData(
      icon: Icons.format_size,
      title: "Choose your\ninterests",
      textColor: Colors.white,
      bgColor: Color(0xFFFDBFDD),
    ),
    PageData(
      icon: Icons.hdr_weak,
      title: "Drag and\ndrop to move",
      bgColor: Color(0xFFFFFFFF),
    ),
    PageData(
      icon: Icons.bubble_chart,
      title: "Local news\nstories",
      bgColor: Color(0xFF0043D0),
      textColor: Colors.white,
    ),
  ];

  List<Color> get colors => pages.map((p) => p.bgColor).toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ConcentricPageView(
          colors: colors,
          opacityFactor: 1.0,
          scaleFactor: 0,
          radius: 200,
          curve: Curves.ease,
          duration: Duration(seconds: 2),
          verticalPosition: 0.8,
          direction: Axis.horizontal,
          itemCount: pages.length,
          //physics: NeverScrollableScrollPhysics(),
          itemBuilder: (index, value) {
            PageData page = pages[index % pages.length];
            // For example scale or transform some widget by [value] param
            //            double scale = (1 - (value.abs() * 0.4)).clamp(0.0, 1.0);
            return Container(
              child: Theme(
                data: ThemeData(
                  textTheme: TextTheme(
                    title: TextStyle(
                      color: page.textColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Helvetica',
                      letterSpacing: 0.0,
                      fontSize: 36,
                    ),
                    subtitle: TextStyle(
                      color: page.textColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ),
                child: PageCard(page: page),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PageOverlay extends StatelessWidget {
  final OverlayData overlay;

  const PageOverlay({
    Key key,
    @required this.overlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              overlay.heading,
              style: Theme.of(context).textTheme.display1,
            ),
            Expanded(child: overlay.content),
            Text(overlay.buttonText),
          ],
        ),
      ),
    );
  }
}

class PageCard extends StatelessWidget {
  final PageData page;

  const PageCard({
    Key key,
    @required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildPicture(context),
          SizedBox(height: 80),
          _buildText(context),
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Text(
      page.title,
      style: Theme.of(context).textTheme.title,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildPicture(
      BuildContext context, {
        double size = 190,
        double iconSize = 170,
      }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(60.0)),
        color: page.bgColor
//            .withBlue(page.bgColor.blue - 40)
            .withGreen(page.bgColor.green + 20)
            .withRed(page.bgColor.red - 100)
            .withAlpha(90),
      ),
      margin: EdgeInsets.only(
        top: 140,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(
            child: RotatedBox(
              quarterTurns: 2,
              child: Icon(
                page.icon,
                size: iconSize + 20,
                color: page.bgColor
                    .withBlue(page.bgColor.blue - 10)
                    .withGreen(220),
              ),
            ),
            right: -5,
            bottom: -5,
          ),
          Positioned.fill(
            child: RotatedBox(
              quarterTurns: 5,
              child: Icon(
                page.icon,
                size: iconSize + 20,
                color: page.bgColor.withGreen(66).withRed(77),
              ),
            ),
          ),
          Icon(
            page.icon,
            size: iconSize,
            color: page.bgColor.withRed(111).withGreen(220),
          ),
        ],
      ),
    );
  }
}

