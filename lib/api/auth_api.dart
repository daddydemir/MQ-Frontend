// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:mq_frontend/data/local.dart';
import 'package:mq_frontend/responsive/dimensions.dart';
import 'package:http/http.dart' as http;

class AuthApi {

  var data = Local();

  Future Login(var username, var password) async {
    var url = Uri.parse("${base}login");

    return await http.post(url,
        headers: {"Content-Type": "application/json; charset=UTF-8"},
        body: jsonEncode(
            <String, String>{"Mail": username, "Password": password}));
  }

  Future GetHistoryById(var id) async {
    var url = Uri.parse("${base}history/$id");

    return await http.get(url, headers: {
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": data.ReadCookie("token")
    });
  }
}
