import 'package:construction/assets/assets.dart';
import 'package:flutter/material.dart';

import '../assets/log_out.dart';
import '../assets/order_info.dart';
import '../conditions/Fetch_Order.dart';

class DetailsCard extends StatefulWidget {
  DetailsCard({Key? key, required this.id}) : super(key: key);
  var id;
  int idvalue() {
    return id;
  }

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  final _searchvalue = TextEditingController();

  set orderid(String orderid) {}

  void dispose() {
    // TODO: implement dispose
    _searchvalue.dispose();
    super.dispose();
  }

  void _onchangedid(String value) {
    setState(() {
      orderid = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    int orderid = widget.idvalue();
    double hieght = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: hieght * 0.1,
        backgroundColor: primary,
        title: Text("Order Details"),
        actions: [
          logout(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Column(children: [
            Infocard(
              title: "ORDER ID",
              value: orderid,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("REQURED DATE RANGE",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 137, 137, 137))),
                  Container(
                    child: Text(""),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: valuecard(
                          value: orderid,
                          title: "fromDate",
                        ),
                      ),
                      const Expanded(
                          flex: 1,
                          child: Center(
                              child:
                                  Text("to", style: TextStyle(fontSize: 18)))),
                      Expanded(
                        flex: 1,
                        child: valuecard(
                          value: orderid,
                          title: "toDate",
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Infocard(
              title: "SITE ENGINEER",
              value: orderid,
            ),
            Infocard(
              title: "SUBCONTRACTOR",
              value: orderid,
            ),
            Infocard(
              title: "SECTION INCHARGE",
              value: orderid,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Flexible(
                      flex: 3,
                      child: Text("DATE & TIME",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 137, 137, 137)))),
                  Spacer(),
                  valuecard(
                    value: orderid,
                    title: "createdAt",
                  ),
                  valuecard(
                    value: orderid,
                    title: "time",
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              height: 300,
              width: double.infinity,
              color: primary,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 27, 40, 182)),
              height: 300,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 6),
              child: Column(),
            )
          ]),
        ),
      ),
    );
  }
}
