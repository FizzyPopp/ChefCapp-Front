import 'package:chef_capp/index.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 48.0,
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
                      "Welcome to Chef Capp",
                      style: CCText.mobileDisplayLarge,
                      maxLines: 2,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Image.asset("assets/images/onboarding/onboarding001.png"),
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
                        GradientButton(
                          child: Text(
                            "GET STARTED",
                            style: CCText.darkButton,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()
                              ),
                            );
                          },
                          gradient: CCColors.primaryGradient,
                        ),
                        SizedBox(height: 16.0,),
                        SizedBox(
                          height: 48.0,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()
                                ),
                              );
                            },
                            child: Text(
                              "LOG IN",
                              style: CCText.lightButton,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0,),
                        FlatButton(
                          child: Text(
                            'Browse without signing in',
                            style: TextStyle(
                              color: Color(0xFF4E4B66),
                              letterSpacing: 0.20,
                            ),
                          ),
                          onPressed: () {
                            ParentController.auth.handleAnonBrowse(context);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
