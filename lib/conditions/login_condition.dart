
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../assets/assets.dart';
import '../pages/homepage.dart';

Future<int> Login(String username, String password, context) async {
  
  final Uri uri = Uri.parse(Login_api);
  final response = await http.get(uri);
  var datareceived = jsonDecode(response.body);
  int str = int.parse(username);
  //int id = username as int;
  if (username == "" && password == "") {
    print("Enter userid and password");
    showAlertDialog(context, "USER ID and PASSWORD");
  } else if (str == 0) {
    showAlertDialog(context, "USER ID");
  } else if (str == 0) {
    showAlertDialog(context, "PASSWORD");
  } else {
    for (int i = 0; datareceived.length > i; i++) {
      print(i);

      print(datareceived.length);
      if (datareceived[i]['userId'] == str &&
          datareceived[i]['password'] == password) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => HomePage()));
        print("successfull");
        break;
      } else if (i == (datareceived.length - 1)) {
        print(i);
        showAlertDialog(context, "Correct USERNAME and PASSWORD");
      }
    }
  }

  return str;
}

showAlertDialog(BuildContext context, String name) {
  AlertDialog alert = AlertDialog(
    content: Text("Enter " + name),
    actions: [],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
