import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'assets.dart';

class Infocard extends StatelessWidget {
  const Infocard({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 3,
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 137, 137, 137)))),
          Spacer(),
          valuecard(
            value: value,
            title: actualtitle(title),
          ),
        ],
      ),
    );
  }
}

String actualtitle(String title) {
  if (title == "ORDER ID") {
    return "orderId";
  } else if (title == "SITE ENGINEER") {
    return "siteEngineerId";
  } else if (title == "SUBCONTRACTOR") {
    return "subContractor";
  } else if (title == "SECTION INCHARGE") {
    return "sectionIcId";
  } else {
    return title;
  }
  //return "";
}

class valuecard extends StatelessWidget {
  const valuecard({
    Key? key,
    required this.value,
    required this.title,
  }) : super(key: key);

  final int value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Card(
        color: Colors.black,
        child: Container(
          height: 32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 71, 71, 71),
                    blurRadius: 3,
                    spreadRadius: 0.5,
                    blurStyle: BlurStyle.normal,
                    offset: Offset.fromDirection(0, 1))
              ],
              border:
                  Border.all(width: 1.5, color: Color.fromARGB(120, 0, 0, 0))),
          child: Padding(
              padding:
                  const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              child: Center(
                child: FutureBuilder<List>(
                    future: fetchorderdata(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print('error in loading' + snapshot.error.toString());
                      }
                      if (snapshot.hasData) {
                        //print(snapshot.data);
                        return orderdata(
                          list: [snapshot.data],
                          index: value,
                          title: title,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              )
              // style: const TextStyle(fontSize: 18))

              ),
        ),
      ),
    );
  }
}

Future<List> fetchorderdata() async {
  print("connecting");

  final Uri uri = Uri.parse(orderAPI);
  final response = await http.get(uri);
  var datareceived = jsonDecode(response.body);
  String str = "hello";

  return datareceived;
}

class orderdata extends StatelessWidget {
  final List list;
  final int index;
  final String title;

  const orderdata(
      {Key? key, required this.list, required this.index, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String datas = list[0][index][title].toString();
    if (title == "createdAt" || title == "toDate" || title == "fromDate") {
      print(Date(list[0][index][title]));
      return Text(Date(list[0][index][title]));
    } else if (title == "time") {
      return Text(Time(list[0][index]["createdAt"]));
    }
    return Text(datas);
  }
}

String Date(String date) {
  String optimized = date.toString().substring(0, 10);
  String actualdate = date.toString().substring(8, 10) +
      "-" +
      date.toString().substring(5, 7) +
      "-" +
      date.toString().substring(0, 4);
  return actualdate;
}

String Time(String data) {
  String optimized = data.toString().substring(11, 19);
  print(optimized);
  return optimized;
}
