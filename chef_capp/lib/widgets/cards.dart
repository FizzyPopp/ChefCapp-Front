import 'package:chef_capp/index.dart';

class MiniRecipeCard extends StatelessWidget {
  final String cardText;
  final String heroID;
  final String imgURL;
  final Function onTap;

  MiniRecipeCard({
    @required this.cardText,
    @required this.heroID,
    @required this.imgURL,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(cardMargins),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: miniCardHeight(context),
          width: halfColumn(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Hero(
                  tag: heroID,
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.transparent],
                      ).createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.srcATop,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/placeholder.jpg',
                      image: imgURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(gutters),
                child: AutoSizeText(
                  cardText,
                  style: Theme.of(context).textTheme.subhead,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FullRecipeCard extends StatelessWidget {
  final String cardText;
  final String imgURL;
  final int time;
  final int calories;
  final int haveIngredients;
  final int totalIngredients;
  final Function onTap;

  FullRecipeCard({
    @required this.cardText,
    @required this.imgURL,
    @required this.time,
    @required this.calories,
    @required this.haveIngredients,
    @required this.totalIngredients,
    @required this.onTap
  });

  Color _cardCaptionColor(BuildContext context) {
    return Theme.of(context).textTheme.caption.color;
  }

  TextStyle _cardCaptionStyle(BuildContext context) {
    return TextStyle(
      color: _cardCaptionColor(context),
      fontWeight: Theme.of(context).textTheme.body1.fontWeight,
      fontFamily: Theme.of(context).textTheme.body1.fontFamily,
      fontSize: Theme.of(context).textTheme.body1.fontSize,
      height: Theme.of(context).textTheme.body1.height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(
        vertical: cardMargins,
        horizontal: cardMargins * 2,
      ),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: cardTextAreaHeight(context),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/placeholder.jpg',
                  image: imgURL,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: cardTextAreaWidth(context),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: gutters),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      AutoSizeText(
                        cardText,
                        style: Theme.of(context).textTheme.title,
                        minFontSize: Theme.of(context).textTheme.title.fontSize,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.spaceBetween,
                            runSpacing: gutters / 2,
                            children: <Widget>[
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.timelapse,
                                    color: _cardCaptionColor(context),
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    time.toString() + " mins",
                                    style: _cardCaptionStyle(context),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.whatshot,
                                    color: _cardCaptionColor(context),
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    calories.toString() + " cal",
                                    style: _cardCaptionStyle(context),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: gutters / 2,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                haveIngredients.toString() + "/" + totalIngredients.toString() + " ingredients",
                                style: _cardCaptionStyle(context),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeroCard extends StatelessWidget {
  final String cardHeading;
  final String cardText;
  final String heroID;
  final Image cardImage;
  final Function onTap;

  HeroCard({
    @required this.cardHeading,
    @required this.cardText,
    @required this.heroID,
    @required this.cardImage,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(cardMargins),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: heroCardHeight(context),
          width: fullColumn(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Hero(
                  tag: heroID,
                  child: cardImage,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(gutters),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      cardHeading,
                      style: Theme.of(context).textTheme.overline,
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    AutoSizeText(
                      cardText,
                      style: Theme.of(context).textTheme.title,
                      maxLines: 2,
                      minFontSize: Theme.of(context).textTheme.title.fontSize,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
