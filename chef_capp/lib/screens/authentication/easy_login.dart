import 'package:chef_capp/index.dart';
import 'package:provider/provider.dart';

class EasyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Consumer<AuthController>(
      builder: (context, data, _) {
        return RaisedButton(
          child: Text(data.loginButtonText),
          padding: EdgeInsets.symmetric(vertical: 16.0),
          onPressed: data.loginFunction,
        );
      }
    );
    return ChangeNotifierProvider.value(
      value: ParentController.auth,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              BackButton(),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text('Welcome back, Chef!'),
                    ),
                    SizedBox(height: 12.0),
                    Image(
                      image: AssetImage('assets/images/food.jpg'),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 12.0),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 20.0),
                        Expanded(
                          child: RaisedButton(
                            child: Text('Log In'),
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            onPressed: () {
                              ParentController.auth.signInAnon(context);
                            },
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          minimum: EdgeInsets.symmetric(vertical: 20.0),
        ),
      )
    );
  }
}
