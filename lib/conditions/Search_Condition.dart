import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:construction/assets/assets.dart';

Future<int> filterorder(String orderid, context) async {
 
  var api = orderAPI;
  final Uri uri = Uri.parse(api);
  final response = await http.get(uri);
  var datareceived = jsonDecode(response.body);
  int str = 0;
  String id = '';
  //int id = username as int;
  if (orderid == "") {
    showAlertDialog(context, "ORDER ID");
  } else {
    for (int i = 0; datareceived.length > i; i++) {
      if (datareceived[i]['orderid'] == orderid.toUpperCase()) {
        
        return i;
      } else if (i == (datareceived.length - 1)) {
        showAlertDialog(context, "Correct ORDER ID");
       
      }
    }
  }
  return str;
}

showAlertDialog(context, String name) {
   ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                content: Text("Enter $name"),
                ));
}

