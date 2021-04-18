import 'package:chef_capp/index.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/food.jpg'),
                  radius: 24.0,
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Julian Caeser',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(height: 4.0,),
                          Text(
                            'julian.caeser@example.com',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                      Icon(Icons.settings),
                    ],
                  ),
                  onTap: () {

                  },
                ),
              ],
            ),
          ),
          ListTile(
            title: Text("Dietary Restrictions"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => OnboardingAllergies()
              ));
            },
          ),
          ListTile(
            title: Text("Unit Preferences"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => OnboardingCookingPreferences()
              ));
            },
          ),
          ListTile(
            title: Text("Notifications"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => DrawerNotifications()
              ));
            },
          ),
          ListTile(
            title: Text("Help"),
          ),
          if (ParentService.auth.getLoginState() == LoginState.LoggedIn)
            ListTile(
              title: Text(
                "Logout"
              ),
              onTap: () {
                ParentController.auth.handleLogout(context);
                },
            ),
          if (ParentService.auth.getLoginState() == LoginState.Anonymous)
            ListTile(
              title: Text(
                  "Sign up"
              ),
              onTap: () {
                ParentController.auth.handleSignUpLink(context);
              },
            ),
        ],
      ),
    );
  }
}