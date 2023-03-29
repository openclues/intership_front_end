import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intership/models/practice_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum USERTYPE {
  STUDENT,
  COORDINATOR,
  CAREERCENTER,
  ADMIN,
}

enum AuthConnectionMode { offline, tokenInvalid, logedin, logedout }

class MainProvider extends ChangeNotifier {
  final base = "http://192.168.1.46:8000/";
  Student? currentstudent;
  String? token;
  USERTYPE? usertype;
  AuthConnectionMode? authConnectionMode;
//getMethod
  Future<http.Response> getMethod({Map? data, String? path}) async {
    final url = Uri.parse(base + path!);
    http.Response response = await http.get(url,
        headers: token == null ? {} : {"Authorization": "Token $token"});
    return response;
  }

  Future<http.Response> postMethod({Map? data, String? path}) async {
    final url = Uri.parse(base + path!);

    http.Response response = await http.post(url,
        headers: token == null ? {} : {"Authorization": "Token $token"},
        body: data);
    return response;
  }

  Future<http.Response> login({String? username, String? password}) async {
    var response = await postMethod(
        path: "token/login/",
        data: {"username": username, "password": password});

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      await prefs.setString("token", decodedData['auth_token']);
      setUserType(decodedData['type']);
      authConnectionMode = AuthConnectionMode.logedin;
    }
    return response;
  }

  setUserType(String? type) {
    if (type == "Student") {
      usertype = USERTYPE.STUDENT;
    } else if (type == "Coordinator") {
      usertype = USERTYPE.COORDINATOR;
    } else if (type == "Career Center") {
      usertype = USERTYPE.CAREERCENTER;
    }
  }

  is_Authanticated() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedToken = prefs.getString('token');

    if (savedToken != null) {
      token = savedToken;
      var response = await getMethod(path: 'api/users/me/');
      if (response.statusCode != 200) {
        authConnectionMode = AuthConnectionMode.tokenInvalid;
        await prefs.remove('token');
      } else {
        var decodedData = jsonDecode(response.body);
        setUserType(decodedData['type']);
        getData(decodedData);
        authConnectionMode = AuthConnectionMode.logedin;
        token = savedToken;
      }
    } else {
      authConnectionMode = AuthConnectionMode.logedout;
    }

    notifyListeners();
  }

  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    token = null;
    var response = await postMethod(path: '/token/logout/');

    authConnectionMode = AuthConnectionMode.logedout;
  }

  getData(Map<String, dynamic> decodedData) async {
    if (usertype == USERTYPE.STUDENT) {
      Student student = Student.fromJson(decodedData);
      print(student.practises[0].title);
      currentstudent = student;
      notifyListeners();
    }
  }
}
