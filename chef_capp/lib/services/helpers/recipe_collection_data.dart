import 'package:chef_capp/index.dart';

class RecipeCollectionData {
  final RecipeCollection _rc;
  final String _heroID;
  final Function _genHeroID;
  final Function _updateVisibleCollection;

  RecipeCollectionData(this._rc, this._heroID, this._genHeroID, this._updateVisibleCollection);

  RecipeCollection get rc => _rc;
  String get heroID => _heroID;

  Widget toHeroCard(BuildContext context) {
    return
      HeroCard(
        cardHeading: _rc.heading,
        cardText: _rc.title,
        imgURL: _rc.imgURL,
        heroID: _heroID,
        onTap: (){onTapHeroCard(context);},
      );
  }

  void onTapHeroCard(BuildContext context) {
    final List<RecipeData> collection = _rc.recipes.map((r) => RecipeData(r, _genHeroID())).toList();
    _updateVisibleCollection(collection);
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) =>
          DiscoverGenericList(
              title: _rc.title,
              metaSelector: (DiscoverController model) => model.generic
          ),
    ));
  }
}