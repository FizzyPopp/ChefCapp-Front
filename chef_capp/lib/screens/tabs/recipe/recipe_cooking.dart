import 'package:chef_capp/index.dart';

class RecipeCooking extends StatelessWidget {
  final RecipeController rc;

  RecipeCooking({
    @required this.rc,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> cookingSteps = getRecipeSteps(context, rc.rd.r);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Swiper(
              itemBuilder: (BuildContext context, int index) {
                return cookingSteps[index];
              },
              scrollDirection: Axis.horizontal,
              pagination: SwiperPagination(
                //alignment: Alignment.centerRight,
                builder: SwiperPagination.fraction,
              ),
              control: SwiperControl(
                padding: EdgeInsets.fromLTRB(
                  xMargins - 6,
                  xMargins,
                  xMargins - 6,
                  xMargins,
                ),
              ),
              loop: false,
              itemCount: cookingSteps.length,
              viewportFraction: 1,
              scale: 0.9,
              fade: 0.1,
            ),
            Positioned(
              right: 0,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getRecipeSteps(BuildContext context, Recipe r) {
    List<Widget> out = [...(r.steps.map((step) => CookingStep(
        ingredientChipList: getChips(step),
        stepText: getStepText(context, step)
    )).toList())];
    out.add(FinalStep());
    return out;
  }

  List<Widget> getChips (RecipeStep step) {
    return step.chips.map((c) => IngredientChip(label: c)).toList();
  }

  List<TextSpan> getStepText(BuildContext context, RecipeStep step) {
    if (step.description.length == 0) {
      return [];
    }
    return step.description.map((d) {
      switch(d.style) {
        case TextMod.copy:
          return TextSpan(text: d.text);
        case TextMod.name:
          return TextSpan(
            text: d.text,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          );
        default:
          return TextSpan(text: d.text);
      }
    }).toList();
  }
}

class IngredientChip extends StatelessWidget {
  final String label;

  IngredientChip({this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}

class CookingStep extends StatelessWidget {
  final List<Widget> ingredientChipList;
  final List<TextSpan> stepText;

  CookingStep({
    @required this.ingredientChipList,
    @required this.stepText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: CustomScrollView(
            reverse: true,
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: xMargins,
                        vertical: xMargins,
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.end,
                        spacing: 4.0,
                        runSpacing: 4.0,
                        children: ingredientChipList,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: xMargins),
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.robotoSlab(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                          children: stepText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 64.0),
      ],
    );
  }
}

class FinalStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Am done le cooking!'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}