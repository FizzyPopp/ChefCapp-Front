import 'package:chef_capp/index.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  bool _emailIsValid = false;
  bool _passwordIsValid = false;
  RegExp _emailRegExp = new RegExp(
      r"[a-z0-9!#$%&'*+/=?^_‘{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_‘{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
  RegExp _alphaLowerRegExp = new RegExp(r"[a-z]");
  RegExp _alphaUpperRegExp = new RegExp(r"[A-Z]");
  RegExp _digitRegExp = new RegExp(r"\d");
  RegExp _specialCharRegExp = new RegExp(r"[^a-zA-Z0-9]");

  String _name, _email, _password;

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
          child: ListView(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: 48.0,
                child: FlatButton.icon(
                  icon: Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 14.0,
                  ),
                  label: Text(
                    'Back',
                    //style: CCText.lightButton,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 12.0,
                ),
                child: AutoSizeText(
                  "Sign up to start cooking",
                  style: CCText.mobileDisplayLarge,
                  maxLines: 2,
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
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (text) {
                        _name = text;
                      }
                    ),
                    SizedBox(height: 16.0,),
                    Consumer<AuthController>(
                      builder: (context, data, _) {
                        return TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) {
                            String _emailMatch = _emailRegExp.stringMatch(email);
                            if (email == _emailMatch) {
                              _emailIsValid = true;
                              return null;
                            }
                            else {
                              _emailIsValid = false;
                              return 'Please enter a valid email address.';
                            }
                          },
                          onChanged: (text) {
                            _email = text;
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
                            validator: (password) {
                              if (password.length > 16
                                  || password.length > 8
                                      && _alphaLowerRegExp.hasMatch(password)
                                      && _alphaUpperRegExp.hasMatch(password)
                                      && _digitRegExp.hasMatch(password)
                                      &&
                                      _specialCharRegExp.hasMatch(password)) {
                                _passwordIsValid = true;
                                return null;
                              } else {
                                _passwordIsValid = false;
                                return 'Please ensure password meets the requirements below.';
                              }
                            },
                            onChanged: (text) {
                              _password = text;
                              data.notify();
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _obscurePassword,
                          );
                        }
                    ),
                    SizedBox(height: 16.0,),
                    Text(
                      'Password must be a minimum of 8 characters long,'
                          ' including one number (0-9), one special character'
                          ' (~!@#\$%^&), one uppercase letter, and one lowercase '
                          'letter.',
                      style: TextStyle(
                        color: CCColors.secondary,
                      ),
                    ),
                    SizedBox(height: 16.0,),
                    Text(
                        'By clicking Sign Up, you agree and consent to the User'
                            ' Agreement and the Privacy Policy.'
                    ),
                    SizedBox(height: 16.0,),
                    Consumer<AuthController>(
                      builder: (context, data, _) {
                        return GradientButton(
                          child: Text(
                            "SIGN UP",
                            style: CCText.darkButton,
                          ),
                          gradient: CCColors.primaryGradient,
                          onPressed: () {
                            if (_passwordIsValid && _emailIsValid) {
                              // Submit register requests
                              ParentController.auth.handleSignUp(context, _name, _email, _password);
                            } else {
                              // not sure how to do warning here
                            }
                          },
                          loading: data.getSigningUp(),
                          enabled: !data.getSigningUp() && _emailIsValid && _passwordIsValid,
                        );
                      }
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