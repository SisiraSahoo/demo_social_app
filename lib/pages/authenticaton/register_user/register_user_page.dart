import 'package:demo_social_app/app_configs/app_colors.dart';
import 'package:demo_social_app/pages/authenticaton/register_user/register_user_page_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demo_social_app/app_configs/app_decorations.dart';
import 'package:demo_social_app/app_configs/app_validators.dart';
import 'package:demo_social_app/widgets/app_buttons/app_primary_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterUserPage extends StatefulWidget {
  static const String routeName = '/RegisterUser';

  const RegisterUserPage({Key? key}) : super(key: key);

  @override
  _RegisterUserPageState createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage>
    with SingleTickerProviderStateMixin {
  late RegisterUserController _registerController;

  @override
  void initState() {
    super.initState();
    _registerController = RegisterUserController();
    _registerController.onInit();
  }

  @override
  void dispose() {
    _registerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
        Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                   SizedBox(height: MediaQuery.of(context).size.height/4),
                  Obx(
                        () => Form(
                      key: _registerController.formKey,
                      autovalidateMode:
                      _registerController.autoValidateMode.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22),
                            child: TextFormField(
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.name,
                              // inputFormatters: [
                              //   LengthLimitingTextInputFormatter(10),
                              //   FilteringTextInputFormatter.digitsOnly
                              // ],
                              onSaved: _registerController.onNameSaved,
                              onFieldSubmitted: (s) =>
                                  _registerController.registerEmail(),
                              validator: (value) =>
                                  AppFormValidators.validateEmpty(
                                      value, context),
                              decoration:
                              AppDecorations.textFieldDecoration(
                                  context)
                                  .copyWith(
                                labelText: 'Enter Name*',
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22),
                            child: TextFormField(
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.emailAddress,
                              onSaved: _registerController.onEmailSaved,
                              onFieldSubmitted: (s) =>
                                  _registerController.registerEmail(),
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
                              onSaved: _registerController.onPassSaved,
                              onFieldSubmitted: (s) =>
                                  _registerController.registerEmail(),
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
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: FormField<DateTime>(
                                validator:
                                    (value) =>
                                    AppFormValidators.validateEmpty(
                                        value, context),
                                onSaved: _registerController.onDobSaved,
                                builder: (FormFieldState<DateTime>
                                state) =>
                                    Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: MediaQuery.of(context).size.width/2,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    6),
                                                color: const Color(0xffFFFFFF),
                                                border: Border.all(
                                                    color: AppColors
                                                        .borderColor,
                                                    width: 1.2)),
                                            clipBehavior: Clip.antiAlias,
                                            child: InkWell(
                                              onTap: () async {
                                                FocusScope.of(context)
                                                    .requestFocus(
                                                    FocusNode());
                                                final now =
                                                DateTime.now();
                                                final picked =
                                                await showDatePicker(
                                                    context: context,
                                                    firstDate:
                                                    DateTime(
                                                        now.year -
                                                            100,
                                                        now.month,
                                                        now.day),
                                                    lastDate:
                                                    DateTime(
                                                        now.year -
                                                            13,
                                                        now.month,
                                                        now.day),
                                                    initialDate:
                                                    DateTime(
                                                        now.year -
                                                            13,
                                                        now.month,
                                                        now.day));
                                                if (picked != null) {
                                                  state.didChange(picked);
                                                }
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets
                                                    .fromLTRB(
                                                    20, 13, 60, 14),
                                                child: Text(
                                                  state.value == null
                                                      ? 'Choose '
                                                      : DateFormat(
                                                      'MM/dd/yyyy')
                                                      .format(state
                                                      .value!),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1,
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (state.hasError)
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 18,
                                                  vertical: 6),
                                              child: Text(
                                                  '${state.errorText}',
                                                  style: TextStyle(
                                                      color: Theme.of(
                                                          context)
                                                          .errorColor)),
                                            )
                                        ])),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AppPrimaryButton(
                child: const Text('Register'),
                onPressed: _registerController.registerEmail,
                key: _registerController.buttonKey,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

    );
  }
}
