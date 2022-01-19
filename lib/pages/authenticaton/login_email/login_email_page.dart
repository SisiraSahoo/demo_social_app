import 'package:demo_social_app/pages/authenticaton/register_user/register_user_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demo_social_app/app_configs/app_decorations.dart';
import 'package:demo_social_app/app_configs/app_validators.dart';
import 'package:demo_social_app/widgets/app_buttons/app_primary_button.dart';
import 'package:get/get.dart';
import 'login_email_controller.dart';

class LoginEmailPage extends StatefulWidget {
  static const String routeName = '/LoginPhonePage';

  const LoginEmailPage({Key? key}) : super(key: key);

  @override
  _LoginEmailPageState createState() => _LoginEmailPageState();
}

class _LoginEmailPageState extends State<LoginEmailPage>
    with SingleTickerProviderStateMixin {
  late LoginPhoneController _loginController;

  @override
  void initState() {
    super.initState();
    _loginController = LoginPhoneController();
    _loginController.onInit();
  }

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: 
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 22, 16, 22),
                  child: Text(
                    "Please enter your email id and password.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                Obx(
                  () => Form(
                    key: _loginController.formKey,
                    autovalidateMode:
                        _loginController.autoValidateMode.value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22),
                          child: TextFormField(
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: _loginController.onEmailSaved,
                            onFieldSubmitted: (s) =>
                                _loginController.loginEmail(),
                            validator: (value) =>
                                AppFormValidators.validateMail(
                                    value, context),
                            decoration:
                                AppDecorations.textFieldDecoration(
                                        context)
                                    .copyWith(
                              labelText: 'Enter Email Id*',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22),
                          child: TextFormField(
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                            // inputFormatters: [
                            //   LengthLimitingTextInputFormatter(10),
                            //   FilteringTextInputFormatter.digitsOnly
                            // ],
                            onSaved: _loginController.onPassSaved,
                            onFieldSubmitted: (s) =>
                                _loginController.loginEmail(),
                            validator: (value) =>
                                AppFormValidators.validateEmpty(
                                    value, context),
                            decoration:
                                AppDecorations.textFieldDecoration(
                                        context)
                                    .copyWith(
                              labelText: 'Enter Password*',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: AppPrimaryButton(
                    child: const Text('Login'),
                    onPressed: _loginController.loginEmail,
                    key: _loginController.buttonKey,
                  ),
                ),
                RichText(text: TextSpan(
                  text: "Don't have an account?",
                  style: const TextStyle(
                    color: Colors.black
                        ,fontSize: 16
                  ),
                  children: [
                    TextSpan(
                      text: ' Register here',
                        style:  TextStyle(
                            color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(RegisterUserPage.routeName);
                        }
                    ),

                  ]
                )),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      
    );
  }
}
