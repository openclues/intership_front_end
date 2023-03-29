import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intership/providers/main_provider.dart';
import 'package:intership/screens/auth_screens/signup_auth_screen.dart';
import 'package:intership/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../../constants/color.dart';

class LoginAuthScreen extends StatefulWidget {
  const LoginAuthScreen({Key? key}) : super(key: key);

  @override
  State<LoginAuthScreen> createState() => _LoginAuthScreenState();
}

class _LoginAuthScreenState extends State<LoginAuthScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var data = Provider.of<MainProvider>(context);

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.15,
              child: Stack(
                children: [
                  Container(
                    height: height,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: -200,
                    left: -40,
                    child: Container(
                      height: height * 0.4,
                      width: width,
                      decoration: BoxDecoration(
                        color: mainColor.withOpacity(.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -220,
                    right: -200,
                    child: Container(
                      height: height * 0.4,
                      width: width,
                      decoration: BoxDecoration(
                        color: mainColor.withOpacity(.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                data.login(password: "123", username: "islam");
                // data.getStatusCode();
              },
              child: SizedBox(
                height: height * 0.3,
                child: Image.asset('assets/logo.png'),
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
                      "Login",
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
            LoginForm(width: width),
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
                Container(height: 1, width: width * 0.2, color: Colors.grey),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Not registered yet?",
                  style: TextStyle(color: Colors.black),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignupAuth()));
                  },
                  child: const Text(
                    "Create an account",
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final double? width;
  LoginForm({Key? key, required this.width}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool? _isHidden = true;

  String? username;
  String? password;
  bool? isloading = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var data = Provider.of<MainProvider>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
              onSaved: (value) {
                setState(() {
                  username = value;
                });
              },
              is_abstract: false,
              width: widget.width!,
              hintText: "Enter User ID",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Username cannot be empty";
                }
                return null;
              }),
          SizedBox(
            height: widget.width! * 0.05,
          ),
          CustomTextField(
            onSaved: (value) {
              password = value;
            },
            is_abstract: true,
            width: widget.width!,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter password";
              }
              return null;
            },
            hintText: " Enter password",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: widget.width! * 0.05),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: height * 0.06,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          //show dialog
                          _formKey.currentState!.save();
//future duration

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
                                                "Logging in",
                                                style: TextStyle(),
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
                          await Future.delayed(const Duration(seconds: 1),
                              () async {
                            await data
                                .login(username: username!, password: password!)
                                .then((value) {
                              if (value.statusCode == 200 ||
                                  value.statusCode == 201) {
                                print("Passed");
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: mainColor,
                                        content: Text("Login successful",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white))));
                                Navigator.of(context).pushAndRemoveUntil(
                                    (MaterialPageRoute(builder: (context) {
                                      return const HomeScreen();
                                    })),
                                    (route) => false);
                              } else {
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: mainColor,
                                        content: Text("Invalid Credentials",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white))));
                              }
                            });
                          });
                        }
                      },
                      child: const Text("Login"),
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
        ],
      ),
    );
  }
}

_buildDialog(BuildContext context, bool? isloading) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: isloading!
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const Text("Login Successful"),
        );
      });
}

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final bool? is_abstract;
  final double width;
  final void Function(String?)? onSaved;
  const CustomTextField({
    Key? key,
    required this.onSaved,
    required this.hintText,
    required this.validator,
    required this.is_abstract,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        margin: hintText == "First name" || hintText == "Last name"
            ? EdgeInsets.only(right: width * 0.05)
            : EdgeInsets.symmetric(horizontal: width * 0.05),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: TextFormField(
            onSaved: onSaved,
            validator: validator,
            obscureText: is_abstract!,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(2),
              hintText: "${hintText!}",
              hintStyle: const TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
        ));
  }
}
