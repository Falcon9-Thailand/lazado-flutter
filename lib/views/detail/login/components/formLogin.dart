import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:naiban/themes/color_app.dart';

import 'formError.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  bool emailorpassword;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  void validateFormLogin() {
    if (_formKey.currentState.validate()) {
      if (emailorpassword) {
        navigationLoginByEmailScreen();
      } else {
        navigationLoginByPhoneNumberScreen();
      }
    }
  }

  void navigationLoginByEmailScreen() {
    Navigator.of(context).pushNamed('/LoginByEmailScreen');
  }

  void navigationLoginByPhoneNumberScreen() {
    Navigator.of(context).pushNamed('/LoginByPhoneNumberScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Text(
              "LZADO",
              style: TextStyle(color: sTextTitle2Color, fontSize: 35),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: buildEmailFormField(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 50,
              left: 50,
            ),
            child: FormError(errors: errors),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Checkbox(
                //   value: remember,
                //   activeColor: sPrimaryColor,
                //   onChanged: (value) {
                //     setState(() {
                //       remember = value;
                //     });
                //   },
                // ),
                // Text(
                //   "Remember me",
                //   style: textStyleFontBody,
                // ),
                // Spacer(),
                GestureDetector(
                  onTap: null,
                  // onTap: () => Navigator.pushNamed(
                  //     context, ForgotPasswordScreen.routeName),
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50, bottom: 20),
            child: GestureDetector(
              onTap: () => validateFormLogin(),
              child: Container(
                alignment: Alignment.center,
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: sPrimaryColor,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 5,
                          spreadRadius: 2,
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                child: Text("เข้าสู่ระบบ"),
              ),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => email = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kEmailNullError);
          } else if (EmailValidator.validate(value)) {
            if (isValidPhoneNumber(value)) {
              removeError(error: kPhoneNullError);
              removeError(error: kInvalidEmailError);
            }
            return null;
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kEmailNullError);
            return null;
          } else if (!EmailValidator.validate(value)) {
            if (!isValidPhoneNumber(value)) {
              addError(error: kInvalidEmailError);
              addError(error: kPhoneNullError);
              return null;
            }
            setState(() {
              emailorpassword = false;
            });

            return null;
          } else {
            setState(() {
              emailorpassword = true;
            });
          }

          return null;
        },
        decoration: otpInputDecorationEmail);
  }
}
