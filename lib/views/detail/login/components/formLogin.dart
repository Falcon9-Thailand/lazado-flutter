import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:naiban/themes/color_app.dart';
import 'formError.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String email, password;
  TextEditingController emailTextEditingControlle = TextEditingController();
  TextEditingController passwordTextEditingControlle = TextEditingController();

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

  void validateFormLogin() {}

  void navigationLoginByEmailScreen() {
    Navigator.of(context).pushNamed('/LoginByEmailScreen');
  }

  void navigationHomePageScreen() {
    Navigator.of(context).pushReplacementNamed('/HomePage');
  }

  Future<void> authCreateUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showInSnackBar("รหัสผ่านคุณอ่อนแอเกินไป");
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showInSnackBar("อีเมลนี้มีคนใช้แล้ว");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> authSignInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() => navigationHomePageScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showInSnackBar('ไม่พบบัญชีผู้ใช้นี้');
      } else if (e.code == 'wrong-password') {
        showInSnackBar('รหัสผ่านไม่ถูกต้อง');
      }
    }
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextNameApp(),
            sizedBoxHeight10(),
            textFormFieldEmail(node),
            sizedBoxHeight10(),
            textFormFieldPassword(node),
            sizedBoxHeight10(),
            FormError(errors: errors),
            buildSizedBox(),
            buttonSignin(),
            sizedBoxHeight10(),
            ForgetPassword(),
            Divider(),
            SigninSosialButton()
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox() {
    return SizedBox(
      height: 10,
    );
  }

  Container textFormFieldEmail(FocusNode node) {
    return Container(
      alignment: Alignment.center,
      height: 50.0,
      decoration: boxDecorationTextFormField,
      child: TextFormField(
        decoration: inPutDecorationTextFormFieldEmail,
        style: TextStyle(color: sTextTitleColor, fontSize: 16),
        obscureText: false,
        onEditingComplete: () => node.nextFocus(),
        onSaved: (value) => email = value,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kEmailNullError);
          } else if (EmailValidator.validate(value)) {
            removeError(error: kInvalidEmailError);
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kEmailNullError);
            return "";
          } else if (!(EmailValidator.validate(value))) {
            addError(error: kInvalidEmailError);
            return "";
          }
          return null;
        },
      ),
    );
  }

  Container textFormFieldPassword(FocusNode node) {
    return Container(
      height: 50.0,
      alignment: Alignment.center,
      decoration: boxDecorationTextFormField,
      child: TextFormField(
        decoration: inPutDecorationTextFormFieldPassword,
        onSaved: (newValue) => password = newValue,
        onEditingComplete: () => node.nextFocus(),
        obscureText: true,
        style: TextStyle(color: sTextTitleColor, fontSize: 16),
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPassNullError);
          } else if (value.length >= 8) {
            removeError(error: kShortPassError);
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
          return null;
        },
      ),
    );
  }

  GestureDetector buttonSignin() {
    return GestureDetector(
      onTap: () => validateFormLogin(),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        // margin: EdgeInsets.only(left: 8),
        constraints: BoxConstraints.expand(height: 50),
        decoration: boxDecorationButtonSignin,
        child: Text("เข้าสู่ระบบ"),
      ),
    );
  }

  Widget sizedBoxHeight10() {
    return SizedBox(
      height: 10,
    );
  }

  Widget sizedBoxwidth10() {
    return SizedBox(
      width: 10,
    );
  }
}

class SigninSosialButton extends StatelessWidget {
  const SigninSosialButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignInButton(
          Buttons.Google,
          text: "Sign up with Google",
          onPressed: () {},
        ),
        SignInButton(
          Buttons.FacebookNew,
          text: "Sign up with Google",
          onPressed: () {},
        ),
      ],
    );
  }
}

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "หากคุณลืมรหัสผ่าน",
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: null,
          child: Text(
            "คลิ๊กที่นี้",
            style: TextStyle(
                fontSize: 12,
                decoration: TextDecoration.underline,
                color: Colors.green),
          ),
        ),
      ],
    );
  }
}

class TextNameApp extends StatelessWidget {
  const TextNameApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "LZADO",
      style: TextStyle(color: sTextTitle2Color, fontSize: 35),
    );
  }
}
