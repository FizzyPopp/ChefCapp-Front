import 'package:chef_capp/index.dart';

class HorizontalListBuilder extends StatelessWidget {
  final List<Widget> widgetList;
  final double height;
  HorizontalListBuilder({
    @required this.widgetList,
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
        itemCount: widgetList.length,
        itemBuilder: (BuildContext context, int index) {
          return widgetList[index];
        },
      ),
    );
  }
}

class VerticalListBuilder extends StatelessWidget {
  final List<Widget> widgetList;
  VerticalListBuilder(this.widgetList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //shrinkWrap: true,
      //physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        vertical: gutters / 2,
      ),
      scrollDirection: Axis.vertical,
      itemCount: widgetList.length,
      itemBuilder: (BuildContext context, int index) {
        return widgetList[index];
      },
    );
  }
}
