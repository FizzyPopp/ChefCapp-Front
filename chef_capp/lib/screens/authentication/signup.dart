import 'package:chef_capp/index.dart';

class SignUp extends StatelessWidget {
  bool _emailIsValid = false;
  bool _passwordIsValid = false;
  RegExp _emailRegExp = new RegExp(r"[a-z0-9!#$%&'*+/=?^_‘{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_‘{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
  RegExp _alphaLowerRegExp = new RegExp(r"[a-z]");
  RegExp _alphaUpperRegExp = new RegExp(r"[A-Z]");
  RegExp _digitRegExp = new RegExp(r"\d");
  RegExp _specialCharRegExp = new RegExp(r"[^a-zA-Z0-9]");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  ),
                  SizedBox(height: 16.0,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) {
                      String _emailMatch = _emailRegExp.stringMatch(email);
                      if (email == _emailMatch)  {
                        _emailIsValid = true;
                        return null;
                      }
                      else {
                        _emailIsValid = false;
                        return 'Please enter a valid email address.';
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16.0,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (password) {
                      if ( password.length > 16
                        || password.length > 8
                        && _alphaLowerRegExp.hasMatch(password)
                        && _alphaUpperRegExp.hasMatch(password)
                        && _digitRegExp.hasMatch(password)
                        && _specialCharRegExp.hasMatch(password)) {
                          _passwordIsValid = true;
                          return null;
                        } else {
                          _passwordIsValid = false;
                          return 'Please ensure password meets the requirements below.';
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  SizedBox(height: 16.0,),
                  Text( //TODO: discuss whether passwords that we accept might still be rejected by Google
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
                  GradientButton(
                    child: Text(
                      "SIGN UP",
                      style: CCText.darkButton,
                    ),
                    gradient: CCColors.primaryGradient,
                    onPressed: () {
                      if (_passwordIsValid && _emailIsValid) {
                        //Submit register requests
                      } else {
                        //not sure how to do warning here
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                    'Back',
                    //style: CCText.lightButton,
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
                          ),
                          SizedBox(height: 16.0,),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16.0,),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.remove_red_eye),
                            ),
                            obscureText: true,
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

                              },
                            ),
                          ),
                          GradientButton(
                            child: Text(
                              "LOG IN",
                              style: CCText.darkButton,
                            ),
                            onPressed: () {

                            },
                            gradient: CCColors.secondaryGradient,
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
