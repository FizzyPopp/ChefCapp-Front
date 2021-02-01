import 'package:chef_capp/index.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
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
                          validator: (email) => ParentController.auth.validateEmail(email),
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
                            validator: (password) => ParentController.auth.validatePassword(password),
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
                            ParentController.auth.handleSignUp(context, _name, _email, _password);
                          },
                          loading: data.getSigningUp(),
                          enabled: !data.getCanSignUp(),
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