import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intership/models/practice_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider extends ChangeNotifier {
  final base = "http://192.168.1.46:8000/";

  final token = "";
//getMethod
  Future<http.Response> getMethod(
      {String? token, Map? data, String? path}) async {
    final url = Uri.parse(base + path!);
    http.Response response = await http.get(url,
        headers: token == "" ? null : {"Authorization": "Token $token"});
    return response;
  }

  Future<http.Response> postMethod(
      {String? token, Map? data, String? path}) async {
    final url = Uri.parse(base + path!);

    http.Response response = await http.post(url, headers: null, body: data);
    return response;
  }

  Future<http.Response> login({String? username, String? password}) async {
    var response = await postMethod(
        path: "/token/login/",
        data: {"username": username, "password": password});

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", "dsf");
    print(response.body);
    return response;
  }

  // getStatusCode() async {
  //   var response = await getMethod();
  //   List<Practice> practices = (jsonDecode(response.body) as List)
  //       .map((json) => Practice.fromJson(json))
  //       .toList();
  //   print(practices.first.dueTime);
  //   return response.statusCode;
  // }

//login

//logout

}
