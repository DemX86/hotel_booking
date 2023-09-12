import 'package:flutter/material.dart';

const lineHeight = 1.2;

const blueColor = Color(0xff0d72ff);
const lightBlueColor = Color.fromRGBO(13, 114, 255, 0.1);
const greyColor = Color(0xff828796);
const lightGreyColor = Color(0xffa9abb7);

class Styles {
  static const appBarTitle = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: lineHeight,
  );

  static const title = TextStyle(
    color: Colors.black,
    fontSize: 22,
    fontWeight: FontWeight.w500,
    height: lineHeight,
  );

  static const bodyBlack = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: lineHeight,
  );

  static const bodyGrey = TextStyle(
    color: greyColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: lineHeight,
  );

  static const button = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const rating = TextStyle(
    color: Color(0xffffa800),
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const address = TextStyle(
    color: blueColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: lineHeight,
  );

  static const price = TextStyle(
    color: Colors.black,
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  static const peculiarity = TextStyle(
    color: greyColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: lineHeight,
  );

  static final hotelDescription = TextStyle(
    color: Colors.black.withOpacity(0.9),
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: lineHeight,
  );

  static const hotelDetailsButtonTitle = TextStyle(
    color: Color(0xff2c3035),
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: lineHeight,
  );

  static const hotelDetailsButtonSubtitle = TextStyle(
    color: greyColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: lineHeight,
  );

  static const roomDetailsButton = TextStyle(
    color: blueColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: lineHeight,
  );

  static const error = TextStyle(
    color: Colors.red,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: lineHeight,
  );

  static const textField = TextStyle(
    color: Color(0xff14142b),
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: lineHeight,
    letterSpacing: 0.75,
  );

  static const textFieldLabel = TextStyle(
    color: lightGreyColor,
    fontSize: 17,
    fontWeight: FontWeight.w400,
    height: 1.1,
    letterSpacing: 0.17,
  );

  static const textFieldHint = TextStyle(
    color: lightGreyColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.17,
  );

  static const formHelper = TextStyle(
    color: greyColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: lineHeight,
  );

  static const priceTotal = TextStyle(
    color: blueColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: lineHeight,
  );
}
