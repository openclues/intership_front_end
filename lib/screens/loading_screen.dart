// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intership/providers/main_provider.dart';
import 'package:intership/screens/base_screen.dart';
import 'package:intership/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../constants/color.dart';
import 'auth_screens/login_auth_screen.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool loading = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<MainProvider>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: data.is_Authanticated(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(child: CircularProgressIndicator()),
                          SizedBox(),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (data.authConnectionMode ==
                      AuthConnectionMode.logedout ||
                  data.authConnectionMode == AuthConnectionMode.tokenInvalid) {
                print(data.authConnectionMode.toString());
                return LoginAuthScreen();
              } else if (data.authConnectionMode ==
                  AuthConnectionMode.logedin) {
                return BaseScreen();
              } else {
                return Center(
                  child: Text("Nothing"),
                );
              }
            }),
      ),
    );
  }
}

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.wifi_off,
          size: 100,
          color: mainColor,
        ),
        SizedBox(
            child: Center(
          child: Text(
            'There is no internet connection',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        )),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () async {
                //navigate after 2 seconds

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoadingPage()));
              },
              child: Text('Retry')),
        )
      ],
    );
  }
}



//جرب تستدعي كل الداتا تاني بعد تغيير الصورة لتفادي الأخطاء