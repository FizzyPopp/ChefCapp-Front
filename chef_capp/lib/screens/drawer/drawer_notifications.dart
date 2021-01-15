import 'package:chef_capp/index.dart';

class DrawerNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GenericAppBar(
          appBarTitle: 'Notifications',
        ),
        body: VerticalListBuilder(
          [
            NotificationCard(),
            NotificationCard(),
          ]
        ),
    );
  }
}
