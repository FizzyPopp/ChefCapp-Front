import 'package:chef_capp/index.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[

        ],
      ),
    );
  }
}


class ChefDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/food.jpg'),
                  radius: 50.0,
                ),
                Text('Johnny Chocolat')
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
            decoration:  BoxDecoration(
            color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Settings'),
          ),
          ListTile(
            title: Text('Notifications'),
          ),
          ListTile(
            title: Text('Help'),
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (Route<dynamic> route) => false
              );
            },
          ),
        ],
      ),
    );
  }
}