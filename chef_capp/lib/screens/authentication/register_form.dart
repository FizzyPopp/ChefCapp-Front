import 'package:chef_capp/index.dart';

class RegisterForm extends StatelessWidget {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            BackButton(),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    //padding: EdgeInsets.symmetric(vertical: 40.0),
                    child: Text('Register'),
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
                  TextField(
                    onChanged: (text) {
                      email = text;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 12.0),
                  TextField(
                    onChanged: (text) {
                      password = text;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 20.0),
                      Expanded(
                        child: RaisedButton(
                          child: Text('Register'),
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          onPressed: () {
                            ParentController.auth.handleRegister(context, email, password);
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
    );
  }
}
