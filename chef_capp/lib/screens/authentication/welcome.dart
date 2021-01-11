import 'package:chef_capp/index.dart';
import 'package:provider/provider.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: ParentController.auth,
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepOrange, Colors.deepOrange[900]],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
            ),
            child: SafeArea(
              child: Column(
                children: [
                  RaisedButton(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: Colors.deepOrange[900]
                      ),
                    ),
                    color: Colors.white,
                    onPressed: () { ParentController.auth.handleWelcomeGetStarted(context); },
                  ),
                  RaisedButton(
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          color: Colors.deepOrange[900]
                      ),
                    ),
                    color: Colors.white,
                    onPressed: () { ParentController.auth.handleWelcomeLogIn(context); },
                  ),
                  RaisedButton(
                    child: Text(
                      "Browse without signing up",
                      style: TextStyle(
                          color: Colors.deepOrange[900]
                      ),
                    ),
                    color: Colors.white,
                    onPressed: () { ParentController.auth.handleWelcomeBrowse(context); },
                  )
                ]
              )
              //minimum: EdgeInsets.symmetric(vertical: xMargins),
            ),
          ),
        )
    );
  }
}
