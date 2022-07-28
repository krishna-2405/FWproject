import 'package:construction/assets/assets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<List> fetchdata() async {
  print("connecting");
  
   final Uri uri = Uri.parse(orderAPI);
  final response = await http.get(uri);
  var datareceived = jsonDecode(response.body);
  return datareceived;
}

