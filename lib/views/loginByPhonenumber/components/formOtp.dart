import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:naiban/themes/color_app.dart';
import 'package:naiban/views/detail/login/components/formError.dart';

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController smsControllerCode1 = TextEditingController();
  TextEditingController smsControllerCode2 = TextEditingController();
  TextEditingController smsControllerCode3 = TextEditingController();
  TextEditingController smsControllerCode4 = TextEditingController();
  TextEditingController smsControllerCode5 = TextEditingController();
  final List<String> errors = [];
  void navigatorBack() {
    // Navigator.of(context).pushReplacementNamed("/HomePage");
    Navigator.pop(context);
  }

  void navigatorHomeScreen() {
    Navigator.of(context).pushReplacementNamed("/HomePage");
    // Navigator.pop(context);
  }

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

  void getSmsControllerCode() {
    print("value" +
        smsControllerCode1.text +
        smsControllerCode2.text +
        smsControllerCode3.text +
        smsControllerCode4.text +
        smsControllerCode5.text);
    smsControllerCode1.text = "";
    smsControllerCode2.text = "";
    smsControllerCode3.text = "";
    smsControllerCode4.text = "";
    smsControllerCode5.text = "";
    navigatorHomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
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
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Text(
              "กรุณาระบุ TOP ที่ได้รับ",
              style: TextStyle(color: sTextTitle2Color, fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Row(
              children: [
                Expanded(
                    child: buildTextFieldPhoneNumber(node, smsControllerCode1)),
                Expanded(
                    child: buildTextFieldPhoneNumber(node, smsControllerCode2)),
                Expanded(
                    child: buildTextFieldPhoneNumber(node, smsControllerCode3)),
                Expanded(
                    child: buildTextFieldPhoneNumber(node, smsControllerCode4)),
                Expanded(
                    child: buildTextFieldPhoneNumber(node, smsControllerCode5)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "หากยังไม่ได้รับ",
                  style: TextStyle(color: sTextTitle2Color, fontSize: 12),
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () => null,
                  child: Text(
                    "ส่งอีกครั้ง",
                    style: TextStyle(
                        color: sPrimaryColor,
                        fontSize: 12,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 50,
              left: 50,
            ),
            // child: FormError(errors: errors),
          ),
          ConfirmButton(
            press: () => getSmsControllerCode(),
          )
        ],
      ),
    );
  }

  Widget buildButtonSendSms() {
    return InkWell(
        child: Container(
            height: 50,
            width: 100,
            child: Text("Send",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.orange[300]),
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(left: 8)),
        onTap: () => null);
  }

  Container buildTextFieldPhoneNumber(
      FocusNode node, TextEditingController textEditingController) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(left: 8),
      constraints: BoxConstraints.expand(height: 50),
      decoration: BoxDecoration(
          color: Colors.green[50], borderRadius: BorderRadius.circular(16)),
      child: TextField(
        textAlign: TextAlign.center,
        controller: textEditingController,
        decoration: InputDecoration.collapsed(hintText: "x"),
        keyboardType: TextInputType.phone,
        style: TextStyle(fontSize: 18),
        maxLength: 1,
        buildCounter: (BuildContext context,
                {int currentLength, int maxLength, bool isFocused}) =>
            null,
        maxLengthEnforced: true,
        onEditingComplete: () => node.nextFocus(),
      ),
    );
  }
}

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    Key key,
    this.press,
  }) : super(key: key);
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 20),
      child: GestureDetector(
        onTap: press,
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
          child: Text("ยืนยัน"),
        ),
      ),
    );
  }
}
