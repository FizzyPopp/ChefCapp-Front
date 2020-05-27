import 'package:chef_capp/index.dart';

class DiscoverHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GenericAppBar(
        appBarTitle: 'My History',
      ),
      body: VerticalListBuilder(dummyFullCardList(context)),
    );
  }
}
