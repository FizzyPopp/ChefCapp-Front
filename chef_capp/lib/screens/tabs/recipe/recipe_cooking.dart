import 'package:chef_capp/index.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

class RecipeCooking extends StatelessWidget {
  // use Consumer to access RecipeController
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              right: 0,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {

                },
              ),
            ),
            Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 4.0,
                      runSpacing: 4.0,
                      children: <Widget>[
                        IngredientChip(label: '100gr (4 tbsp) salt',),
                        IngredientChip(label: '400gr (2 cups) fresh basil',),
                        IngredientChip(label: '50gr (3 tsp) minced garlic',),
                        IngredientChip(label: '100gr (4 tbsp) salt',),
                        IngredientChip(label: '400gr (2 cups) fresh basil',),
                        IngredientChip(label: '50gr (3 tsp) minced garlic',),
                      ],
                    ),
                    SizedBox(height: gutters,),
                    Expanded(
                      child: CustomScrollView(
                        physics: BouncingScrollPhysics(),
                        slivers: <Widget>[
                          SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: xMargins,
                                    vertical: 0,
                                  ),
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur '
                                      'adipiscing elit. Integer elementum mi eu bibendum dapibus. '
                                      'Morbi semper nibh sit amet tincidunt auctor. Ut molestie '
                                      'tortor maximus enim feugiat vehicula. In et metus eget ante '
                                      'vulputate ultrices sit amet imperdiet ligula. Morbi hendrerit '
                                      'luctus enim. Mauris nulla arcu, tincidunt quis ullamcorper ac, '
                                      'tincidunt vel nulla. Curabitur in felis ac quam feugiat lacinia '
                                      'ornare porttitor nisi. Donec sed tortor neque. Proin ornare '
                                      'elit nec malesuada auctor. Nulla hendrerit, neque a sollicitudin '
                                      'molestie, odio nunc consectetur felis, sed feugiat eros odio '
                                      'eget enim. Vivamus dignissim ex lorem.'
                                        'Lorem ipsum dolor sit amet, consectetur '
                                        'adipiscing elit. Integer elementum mi eu bibendum dapibus. '
                                        'Morbi semper nibh sit amet tincidunt auctor. Ut molestie '
                                        'tortor maximus enim feugiat vehicula. In et metus eget ante '
                                        'vulputate ultrices sit amet imperdiet ligula. Morbi hendrerit '
                                        'luctus enim. Mauris nulla arcu, tincidunt quis ullamcorper ac, '
                                        'tincidunt vel nulla. Curabitur in felis ac quam feugiat lacinia '
                                        'ornare porttitor nisi. Donec sed tortor neque. Proin ornare '
                                        'elit nec malesuada auctor. Nulla hendrerit, neque a sollicitudin '
                                        'molestie, odio nunc consectetur felis, sed feugiat eros odio '
                                        'eget enim. Vivamus dignissim ex lorem.',
                                    style: Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              scrollDirection: Axis.horizontal,
              pagination: SwiperPagination(
                //alignment: Alignment.centerRight,
                builder: SwiperPagination.fraction,
              ),
              control: SwiperControl(
                padding: EdgeInsets.symmetric(
                  //horizontal: screenWidth(context) / 2 - 60,
                  //vertical: screenHeight(context) / 40,
                ),
              ),
              loop: false,
              itemCount: 10,
              viewportFraction: 0.8,
              scale: 0.8,
              fade: 0.1,
            ),
          ],
        ),
      ),
    );
  }
}

class IngredientChip extends StatelessWidget {
  final String label;

  IngredientChip({this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}


/*
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

class RecipeCooking extends StatelessWidget {
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
        body: RecipeCookingSteps(
          colors: colors(context),
          opacityFactor: 1.0,
          scaleFactor: 0,
          radius: 200,
          curve: Curves.ease,
          duration: Duration(seconds: 1),
          verticalPosition: 0.8,
          direction: Axis.vertical,
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

class RecipeCookingSteps extends StatefulWidget {
  /// The [value] will help to provide some animations
  final Function(int index, double value) itemBuilder;
  final int itemCount;
  final PageController pageController;
  final bool pageSnapping;
  final bool reverse;
  final List<Color> colors;
  final ValueNotifier notifier;
  final double scaleFactor;
  final double opacityFactor;
  final double radius;
  final double verticalPosition;
  final Axis direction;
  final ScrollPhysics physics;
  final Duration duration;
  final Curve curve;

  const RecipeCookingSteps({
    Key key,
    @required this.itemBuilder,
    @required this.colors,
    this.itemCount,
    this.pageController,
    this.pageSnapping = true,
    this.reverse = false,
    this.notifier,
    this.scaleFactor = 0.3,
    this.opacityFactor = 0.0,
    this.radius = 40.0,
    this.verticalPosition = 0.75,
    this.direction = Axis.horizontal,
//    this.physics = const NeverScrollableScrollPhysics(),
    this.physics,
    this.duration = const Duration(milliseconds: 1500),
    this.curve = Curves.easeOutSine, // Cubic(0.7, 0.5, 0.5, 0.1),
  })  : assert(itemBuilder != null),
        assert(colors.length >= 2),
        super(key: key);

  @override
  _RecipeCookingStepsState createState() => _RecipeCookingStepsState();
}

class _RecipeCookingStepsState extends State<RecipeCookingSteps> {
  PageController _pageController;

  double _progress = 0;
  int _prevPage = 0;
  Color _prevColor;
  Color _nextColor;

  @override
  void initState() {
    _prevColor = widget.colors[_prevPage];
    _nextColor = widget.colors[_prevPage + 1];
    _pageController = widget.pageController != null
        ? widget.pageController
        : PageController(
      initialPage: 0,
    );

    _pageController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_onScroll);
    if (widget.pageController == null) {
      _pageController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        AnimatedBuilder(
          animation: _pageController,
          builder: (ctx, _) {
            return Container(
              color: _prevColor, // Colors.white,
              child: ClipPath(
                clipper: ConcentricClipper(
                  progress: _progress,
                  reverse: widget.reverse,
                  radius: widget.radius,
                  verticalPosition: widget.verticalPosition,
                ),
                child: Container(
                  color: _nextColor,
//                  color: ColorTween(begin: _prevColor, end: _nextColor)
//                      .transform(_progress), // Colors.blue,
                ),
              ),
            );
          },
        ),
        PageView.builder(
          //          onPageChanged: (page) {
          //            print('new page $page');
          //          },
          controller: _pageController,
          reverse: widget.reverse,
          physics: widget.physics,
          scrollDirection: widget.direction,
          itemCount: widget.itemCount,
          pageSnapping: widget.pageSnapping,
          onPageChanged: _onPageChanged,
          itemBuilder: (context, index) {
//            var i = index % widget.children.length;
            return AnimatedBuilder(
              animation: _pageController,
              builder: (BuildContext context, child) {
                // on the first render, the pageController.page is null,
                // this is a dirty hack
                if (_pageController.position.minScrollExtent == null ||
                    _pageController.position.maxScrollExtent == null) {
                  Future.delayed(Duration(microseconds: 1), () {
                    setState(() {});
                  });
                  return Container();
                }

                final double value = _pageController.page - index;
                final double scale =
                (1 - (value.abs() * widget.scaleFactor)).clamp(0.0, 1.0);
                final double opacity =
                (1 - (value.abs() * widget.opacityFactor)).clamp(0.0, 1.0);

                return Transform.scale(
                  scale: scale,
                  child: Opacity(
//                    duration: Duration(milliseconds: 1000),
                    opacity: opacity,
                    child: widget.itemBuilder(index, value),
                  ),
                );
              },
            );
          },
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * widget.verticalPosition,
          child: _buildButton(),
        ),
      ],
    );
  }

  Widget _buildButton() {
    return RawMaterialButton(
      onPressed: () {
        _pageController.nextPage(
          duration: widget.duration,
          curve: widget.curve,
        );
      },
      constraints: BoxConstraints(
        minWidth: widget.radius * 2,
        minHeight: widget.radius * 2,
      ),
      shape: CircleBorder(),
    );
  }

  void _onPageChanged(int page) {
    // ...
  }

  void _onScroll() {
    ScrollDirection direction = _pageController.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      _prevPage = (_pageController.page + 0.001).toInt();
      _progress = _pageController.page - _prevPage;
//    } else if (direction == ScrollDirection.reverse) {
    } else {
      _prevPage = (_pageController.page - 0.001).toInt();
      _progress = _pageController.page - _prevPage;
//    } else {
//      _progress = 0;
    }

    final int total = widget.colors.length;
    int prevIndex = _prevPage % total;
    int nextIndex = prevIndex + 1;

    if (prevIndex == total - 1) {
      nextIndex = 0;
    }

    _prevColor = widget.colors[prevIndex];
    _nextColor = widget.colors[nextIndex];

    widget.notifier?.value = _pageController.page - _prevPage;
  }
}
*/