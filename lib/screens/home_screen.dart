import 'package:flutter/material.dart';
import 'package:intership/screens/loading_screen.dart';
import 'package:provider/provider.dart';

import '../providers/main_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<MainProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                data.logout();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoadingPage()));
              },
              child: Text("Logout"),
            ),
            Text("Logged In ${data.usertype}"),
          ],
        ),
      ),
    );
  }
}
