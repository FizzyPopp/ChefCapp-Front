import 'package:chef_capp/index.dart';

class HorizontalCardListBuilder extends StatelessWidget {
  final List<Widget> cardList;
  final double height;

  HorizontalCardListBuilder({
    @required this.cardList,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: xMargins / 2,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: cardList.length,
        itemBuilder: (BuildContext context, int index) {
          return cardList[index];
        },
      ),
    );
  }
}

class VerticalCardListBuilder extends StatelessWidget {
  final List<Widget> cardList;
  VerticalCardListBuilder(this.cardList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        //horizontal: xMargins / 2,
        vertical: gutters / 2,
      ),
      scrollDirection: Axis.vertical,
      itemCount: cardList.length,
      itemBuilder: (BuildContext context, int index) {
        return cardList[index];
      },
    );
  }
}
