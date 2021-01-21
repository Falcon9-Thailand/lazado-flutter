import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:naiban/themes/color_app.dart';
import 'package:naiban/views/detail/login/components/formError.dart';

class PasswordForm extends StatefulWidget {
  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String password;
  bool passwordConfirm;
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
      if (passwordConfirm) {
        navigatorHomeScreen();
      }
    }
  }

  void navigatorHomeScreen() {
    Navigator.of(context).pushReplacementNamed("/HomePage");
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
            child: buildPasswordFormField(),
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

  TextFormField buildPasswordFormField() {
    return TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        onSaved: (newValue) => password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPassNullError);
          } else if (value.length >= 8) {
            removeError(error: kShortPassError);
            return null;
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kPassNullError);
            return "";
          } else if (value.length < 8) {
            addError(error: kShortPassError);
            return "";
          }
          setState(() {
            passwordConfirm = true;
          });
          return null;
        },
        decoration: otpInputDecorationPassword);
  }
}
