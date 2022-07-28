import 'package:construction/assets/assets.dart';
import 'package:construction/pages/Return_List.dart';
import 'package:construction/pages/Search_Screen.dart';
import 'package:construction/pages/login_screen.dart';
import 'package:construction/pages/order_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../assets/log_out.dart';
import '../conditions/Search_Condition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listindex = 1;

  final pages = [
    const Page2(),
    orderlist(),
    Returnlist(),
  ];

  String orderid = '';

  void _onItemTapped(int index) {
    setState(() {
      listindex = index;
      //search = false;
    });
  }

  void _onchangedid(String value) {
    setState(() {
      orderid = value;
    });
  }

  pagenavigation(bool search, int i) {
    print(search);
    if (search == false) {
      print("no searching");
      return pages[listindex];
    } else {
      print("searching");
      return SearchScreen(
        i: i,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    bool search = false;
    double width = MediaQuery.of(context).size.width;
    double hieght = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: hieght * 0.1,
        backgroundColor: Color.fromARGB(255, 0, 2, 92),
        automaticallyImplyLeading: false,
        title: Container(
            child: listindex != 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding:
                            EdgeInsets.only(bottom: 5, right: 10, left: 10),
                        height: hieght * 0.06,
                        width: width * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(150, 255, 255, 255)),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              hintText: "Search order",
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  i = await filterorder(orderid, context);
                                  search = true;
                                  print(search);
                                  pagenavigation(search, i);
                                },
                                icon: const Icon(
                                  Icons.search,
                                  color: Color.fromARGB(255, 73, 73, 73),
                                ),
                              ),
                              hintStyle: const TextStyle(
                                color: Color.fromARGB(149, 122, 122, 122),
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            onChanged: _onchangedid,
                          ),
                        ),
                      ),
                    ],
                  )
                : Text("Create A Return")),
        actions: [
          logout(),
        ],
      ),
      body: pagenavigation(search, i),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: primary,
        ),
        child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_chart_outlined,
                ),
                label: "Create Return",
                backgroundColor: Color.fromARGB(255, 0, 2, 92),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.file_copy_sharp,
                ),
                label: "Orders",
                backgroundColor: Color.fromARGB(255, 0, 2, 92),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.assignment_returned,
                ),
                label: "Returns",
                backgroundColor: Color.fromARGB(255, 0, 2, 92),
              ),
            ],
            backgroundColor: Color.fromARGB(255, 0, 2, 92),
            // type: BottomNavigationBarType.shifting,
            currentIndex: listindex,
            selectedItemColor: Color.fromARGB(255, 255, 255, 255),
            unselectedItemColor: Color.fromARGB(255, 186, 186, 186),
            iconSize: 30,
            onTap: _onItemTapped,
            elevation: 5));
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 2",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
