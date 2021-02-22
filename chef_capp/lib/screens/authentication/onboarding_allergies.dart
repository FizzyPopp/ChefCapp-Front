import 'package:chef_capp/index.dart';
import 'package:chef_capp/screens/authentication/onboarding_dietary_restrictions.dart';

class OnboardingAllergies extends StatelessWidget {
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
                      "Do you have any food allergies?",
                      style: CCText.mobileDisplayLarge,
                      maxLines: 3,
                    ),
                  ),
/*                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Image.asset("assets/images/onboarding/onboarding001.png"),
                    ),
                  ),*/
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
                            "NEXT",
                            style: CCText.darkButton,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OnboardingDietaryRestrictions()
                              ),
                            );
                          },
                          gradient: CCColors.primaryGradient,
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