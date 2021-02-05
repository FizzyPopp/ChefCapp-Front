import 'package:chef_capp/index.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatelessWidget {
  String _email = '';
  String _failMessage = 'Unable to send email.';
  String _successMessage() {
    return 'Reset instructions have been sent to ' + _email;
  }

  ForgotPassword() {
    ParentController.auth.resetResetEmailSent();
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
                        'Enter the email address that you used to sign up. '
                        'We will send you an email with a link to reset your password.',
                        style: CCText.mobileDisplaySmall,
                        maxLines: 5,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Image.asset(
                            "assets/images/onboarding/onboarding003.png"
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
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (email) => ParentController.auth.validateEmail(email),
                            onChanged: (text) {
                              _email = text;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 16.0,),
                          Consumer<AuthController>(
                            builder: (context, data, _) {
                              return (data.getResetEmailSent() == ResetEmailStatus.sent) ? Text(
                                _successMessage(),
                                style: TextStyle(
                                  color: CCColors.successDark,
                                ),
                              ) : (data.getResetEmailSent() == ResetEmailStatus.failed) ? Text(
                                _failMessage,
                                style: TextStyle(
                                  color: CCColors.errorDark,
                                ),
                              ) : Container();
                            }
                          ),
                          SizedBox(height: 16.0,),
                          GradientButton(
                            child: Text(
                              "SEND",
                              style: CCText.darkButton,
                            ),
                            onPressed: () {
                              ParentController.auth.handleForgotPassword(context, _email);
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
