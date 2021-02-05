import 'package:chef_capp/index.dart';
import 'package:chef_capp/screens/authentication/forgot_password.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  String _email = "";
  String _password = "";
  bool _obscurePassword = true;

  Icon _obscurePasswordIcon = Icon(Icons.remove_red_eye_outlined);

  void _toggleObscurePassword() {
    _obscurePassword = !_obscurePassword;

    if (_obscurePassword) {
      _obscurePasswordIcon = Icon(Icons.remove_red_eye_outlined);
    } else if (!_obscurePassword) {
      _obscurePasswordIcon = Icon(Icons.remove_red_eye);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ParentController.auth,
      child: Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 48.0,
                  child: FlatButton.icon(
                    icon: Icon(
                      Icons.arrow_back_ios_sharp,
                      size: 14.0,
                      color: CCText.lightButton.color,
                    ),
                    label: Text(
                      'BACK',
                      style: CCText.lightButton,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32.0,
                          vertical: 12.0,
                        ),
                        child: AutoSizeText(
                          "Log in for a personalized experience",
                          style: CCText.mobileDisplayLarge,
                          maxLines: 2,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Image.asset(
                              "assets/images/onboarding/onboarding002.png"
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32.0,
                          vertical: 16.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Consumer<AuthController>(
                              builder: (context, data, _) {
                                return TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    border: OutlineInputBorder(),
                                  ),
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (email) => ParentController.auth.validateEmail(email),
                                  onChanged: (email) {
                                    _email = email;
                                    ParentController.auth.validateEmail(email);
                                    data.notify();
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                );
                              }
                            ),
                            SizedBox(height: 16.0,),
                            Consumer<AuthController>(
                              builder: (context, data, _) {
                                return TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    border: OutlineInputBorder(),
                                    suffixIcon: IconButton(
                                      icon: _obscurePasswordIcon,
                                      onPressed: () {
                                        _toggleObscurePassword();
                                        data.notify();
                                      },
                                    ),
                                  ),
                                  autovalidateMode: AutovalidateMode
                                      .onUserInteraction,
                                  onChanged: (password) {
                                    _password = password;
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: _obscurePassword,
                                );
                              }
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Color(0xFF4E4B66),
                                    letterSpacing: 0.20,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ForgotPassword()
                                    ),
                                  );
                                },
                              ),
                            ),
                            Consumer<AuthController>(
                              builder: (context, data, _) {
                                return GradientButton(
                                  child: Text(
                                    "LOG IN",
                                    style: CCText.darkButton,
                                  ),
                                  onPressed: () {
                                    ParentController.auth.handleLogin(context, _email, _password);
                                  },
                                  gradient: CCColors.secondaryGradient,
                                  loading: data.getLoggingIn(),
                                  enabled: data.canLogIn(),
                                );
                              }
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}


class OldLoginPage extends StatefulWidget {
  @override
  _OldLoginPageState createState() => _OldLoginPageState();
}

class _OldLoginPageState extends State<OldLoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  //final _bloc = LoginBLoC();

  _OldLoginPageState() {
    /*
    var stream = _bloc.authEvent;
    stream.listen((success) {
      if (success) {
        Navigator.pushNamedAndRemoveUntil(context,
            '/home', (Route<dynamic> route) => false);
      } else {
        print("login failed");
      }
    }, onError: (error) {
      print("bad bad not good");
    });
     */
  }

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
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Username',
                    ),
                  ),
                  SizedBox(height: 12.0),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    children: <Widget>[
                      FlatButton(
                        child: Text('Forgot password?'),
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        onPressed: () {
                          _usernameController.clear();
                          _passwordController.clear();
                        },
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: RaisedButton(
                          child: Text('Log In'),
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          onPressed: () {
                            /*
                            _bloc.sink.add(AuthEvent(_usernameController.text,
                                _passwordController.text));
                             */
                            Navigator.pushNamedAndRemoveUntil(context,
                                '/home', (Route<dynamic> route) => false);
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

  @override
  dispose() {
    super.dispose();
    //_bloc.dispose();
  }
}
