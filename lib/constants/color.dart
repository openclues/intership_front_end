import 'package:flutter/material.dart';

const backgroundColor = Color(0xffEFF0F7);
const deon = Color(0xffBBD4CB);
const mainColor = Colors.green;
//
const secondryColor = Color(0xffEE9C3A);

Padding buildheadtext(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: Text(text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
  );
}

const ColorScheme flexSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff82bace),
  onPrimary: Color(0xff151b1e),
  primaryContainer: Color(0xff04666f),
  onPrimaryContainer: Color(0xffd1e8ea),
  secondary: Color(0xffffd682),
  onSecondary: Color(0xff1e1e15),
  secondaryContainer: Color(0xff9e7910),
  onSecondaryContainer: Color(0xfff5ecd3),
  tertiary: Color(0xff243e4d),
  onTertiary: Color(0xffebeef0),
  tertiaryContainer: Color(0xff426173),
  onTertiaryContainer: Color(0xffdfe7eb),
  error: Color(0xffcf6679),
  onError: Color(0xff1e1214),
  errorContainer: Color(0xffb1384e),
  onErrorContainer: Color(0xfff9dde2),
  outline: Color(0xff959999),
  background: Color(0xff171a1c),
  onBackground: Color(0xffe3e4e4),
  surface: Color(0xff141516),
  onSurface: Color(0xfff1f1f1),
  surfaceVariant: Color(0xff171a1b),
  onSurfaceVariant: Color(0xffe3e4e4),
  inverseSurface: Color(0xfffbfdfd),
  onInverseSurface: Color(0xff0e0e0e),
  inversePrimary: Color(0xff455c64),
  shadow: Color(0xff000000),
);

const kPrimaryColor = Color(0xff6849ef);
const kPrimaryLight = Color(0xff8a72f1);
Color cardColor = flexSchemeDark.tertiary;
const buttonColor = Color(0xff001247);
const thirdColors = Color(0xff220066);
const greencolor = Color(0xff006666);
const dartGreen = Color(0xff006666);
const appBarColors = Colors.white;
const whiteTexts = Colors.white;
const blackTexts = Colors.black;
const buttonsColors = Color(0xff001247);
const bigtitleColor = Colors.black;

BoxDecoration boxDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 5,
      spreadRadius: 2,
    )
  ],
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
);

var darkBoxShadows = [
  BoxShadow(
    color: buttonColor.withOpacity(.7),
    // color: Color(0xff001247).withOpacity(.7),
    spreadRadius: 1,
    blurRadius: 1,
    offset: const Offset(0, 3),
  ),
];
var lightBoxShadows = [
  BoxShadow(
    color: Colors.grey.withOpacity(.7),
    spreadRadius: 1,
    blurRadius: 1,
    offset: const Offset(0, 3),
  ),
];

const TextStyle titleTextStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: dartGreen);
