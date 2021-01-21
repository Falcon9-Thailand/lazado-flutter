import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as fontGoogle;

const sPrimaryColor = Color(0xFFFFC800);
const sSucctionColor = Color(0xFFE7E9EA);
const sTextTitleColor = Color(0xFF000000);
const sTextTitle2Color = Color(0xFF808080);

//Style font app
TextStyle textStyleFontHead =
    TextStyle(fontFamily: 'RSU', fontSize: 24, fontWeight: FontWeight.bold);
TextStyle textStyleFontBody =
    TextStyle(fontFamily: 'RSU', fontSize: 16, fontWeight: FontWeight.normal);
TextStyle textStyleFontPrice = TextStyle(
    fontFamily: 'RSU',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.red);
TextStyle textStyleFontPriceHead = TextStyle(
    fontFamily: 'RSU',
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Colors.grey);
TextStyle textStyleActive = TextStyle(
    fontFamily: 'RSU',
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.red);
TextStyle textStyleNoActive =
    TextStyle(fontFamily: 'RSU', fontSize: 15, color: Colors.grey);
TextStyle textStyleHeadName = TextStyle(
    fontFamily: 'RSU',
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Colors.red);
TextStyle textGoogleFontHead =
    fontGoogle.GoogleFonts.kanit(color: Colors.black);

//Validate
const String kPhoneNullError = "Please Enter your Phone Number";
const String kEmailNullError = "Please Enter your email or phonenumber";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kPassText = "หรัสผ่าน";
const String kShortPassError = "Password is to short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const String kEmailOrPhonenumber = "เบอร์โทรศัพทร์ / อีเมล";

//Email InputDecoration
final otpInputDecorationEmail = InputDecoration(
  hintText: kEmailOrPhonenumber,
  filled: true,
  fillColor: Colors.grey.withOpacity(0.2),
  contentPadding: const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
  border: InputBorder.none,
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
  disabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: sTextTitle2Color),
  );
}

final otpInputDecorationPassword = InputDecoration(
  hintText: kPassText,
  filled: true,
  fillColor: Colors.grey.withOpacity(0.2),
  contentPadding: const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
  border: InputBorder.none,
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
  disabledBorder: outlineInputBorder(),
);
//Phone InputDecoration
final otpInputDecorationPhone = InputDecoration(
  helperText: kEmailOrPhonenumber,
  filled: true,
  fillColor: Colors.grey.withOpacity(0.2),
  contentPadding: const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
  border: InputBorder.none,
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
  disabledBorder: outlineInputBorder(),
);

bool isValidPhoneNumber(String string) {
  // Null or empty string is invalid phone number
  if (string == null || string.isEmpty) {
    return false;
  }
  // You may need to change this pattern to fit your requirement.
  // I just copied the pattern from here: https://regexr.com/3c53v
  const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(string)) {
    return false;
  }
  return true;
}
