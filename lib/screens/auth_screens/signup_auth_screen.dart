import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intership/screens/auth_screens/login_auth_screen.dart';

import '../../constants/color.dart';

class SignupAuth extends StatefulWidget {
  const SignupAuth({Key? key}) : super(key: key);

  @override
  State<SignupAuth> createState() => _SignupAuthState();
}

class _SignupAuthState extends State<SignupAuth> {
  final String checkAll =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  final String checkSpecial = r'^(?=.*?[!@#\$&*~])';

  final String checkLetters = r'^(?=.*?[A-Z])(?=.*?[a-z])';

  final String checkNumbers = r'^(?=.*?[0-9])';

  final String checkEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  bool validPassword = false;
  bool validEmail = false;
  bool _obscureText = true;
  String? _email;
  String? _password;
  String? _username;
  String? _firstName;
  String? _lastName;

  final _keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // var data = Provider.of<CourseProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _keyform,
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: height * 0.1,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -190,
                    left: -40,
                    width: width * 0.7, //for the responsive screens.
                    height: height * 0.35,
                    child: Container(
                      // width: 350,
                      // height: 400,
                      decoration: BoxDecoration(
                        color: Color(0xff8356D4).withOpacity(.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -210,
                    right: -20,
                    width: width * 0.6,
                    height: height * 0.35,
                    child: Container(
                      //width: 350,
                      //height: 400,
                      decoration: BoxDecoration(
                        color: Color(0xff989BE4).withOpacity(.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Image.asset(
                'assets/images/deve.png',
                width: width * 0.5,
                height: height * 0.25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(FontAwesomeIcons.user)
                ],
              ),
            ),
            NewCustomFieldForm(
              onSaved: (value) => _username = value,
              hintText: "Username",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "required field";
                }
                return null;
              },
            ),
            Row(
              children: [
                Expanded(
                  child: NewCustomFieldForm(
                    onSaved: (value) => _firstName = value,
                    hintText: "First name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "required field";
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                  child: NewCustomFieldForm(
                    onSaved: (value) => _lastName = value,
                    hintText: "Last name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "required field";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            NewCustomFieldForm(
              onSaved: (value) => _email = value,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              hintText: "Email",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "required field";
                }
                if (!RegExp(checkEmail).hasMatch(value)) {
                  return "Enter a valid email";
                }
                return null;
              },
            ),
            NewCustomFieldForm(
              onSaved: (value) {
                _password = value;
              },
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                  print(_obscureText);
                },
                child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              hintText: "Password",
              obscureText: _obscureText,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "required field";
                }
                if (!RegExp(checkAll).hasMatch(value)) {
                  return "Password must contain at least 8 characters, 1 uppercase, 1 lowercase, 1 number and 1 special character";
                }
                return null;
              },
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: height * 0.06,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_keyform.currentState!.validate()) {
                            _keyform.currentState!.save();
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return Align(
                                    alignment: Alignment.topCenter,
                                    child: BounceInDown(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        height: height * 0.1,
                                        width: width * 0.8,
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: const [
                                              Center(
                                                child: Text(
                                                  "Signing up...",
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              CircularProgressIndicator(
                                                  color: mainColor),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                            // await Future.delayed(const Duration(seconds: 2),
                            //     () async {
                            //   await data
                            //       .signup(_email!, _username!, _password!,
                            //           _firstName!, _lastName!)
                            //       .then((value) {
                            //     if (value.statusCode == 201 ||
                            //         value.statusCode == 200) {
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //           const SnackBar(
                            //               backgroundColor: mainColor,
                            //               content: Text("Sign up successful",
                            //                   textAlign: TextAlign.center,
                            //                   style: TextStyle(
                            //                       color: Colors.white))));
                            //       Navigator.of(context).pushAndRemoveUntil(
                            //           (MaterialPageRoute(builder: (context) {
                            //             return const LoginAuthScreen();
                            //           })),
                            //           (route) => false);
                            //     } else {
                            //       Navigator.of(context).pop();
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //           SnackBar(
                            //               backgroundColor: mainColor,
                            //               content: Text(value.body.toString(),
                            //                   textAlign: TextAlign.center,
                            //                   style: const TextStyle(
                            //                       color: Colors.white))));
                            //     }
                            //   });
                            // });
                          }
                        },
                        child: const Text("Sign up"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(70),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 1, width: width * 0.2, color: Colors.grey),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "OR",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Container(
                    height: 1,
                    width: width * 0.2,
                    color: Colors.grey,
                    margin: EdgeInsets.only(right: 0),
                    padding: EdgeInsets.only(right: 0)),
              ],
            ),
            SizedBox(
              height: height * 0.0001,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.black),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginAuthScreen()));
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}

class NewCustomFieldForm extends StatelessWidget {
  String? hintText;
  String? errorText;
  bool? obscureText;
  Widget? suffixIcon;
  void Function(String?) onSaved;
  AutovalidateMode? autovalidateMode;

  String? Function(String?)? validator;

  NewCustomFieldForm({
    required this.onSaved,
    this.autovalidateMode,
    this.errorText,
    required this.hintText,
    this.obscureText,
    this.suffixIcon,
    @required this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.006),
        child: TextFormField(
          onSaved: onSaved,
          obscureText: obscureText ?? false,
          autovalidateMode: autovalidateMode,
          validator: validator,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: width * 0.04, vertical: height * 0.01),
            suffixIcon: suffixIcon,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
