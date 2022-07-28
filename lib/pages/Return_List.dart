import 'package:flutter/material.dart';
import 'package:construction/assets/assets.dart';

import '../conditions/Fetch_Order.dart';
import 'Order_Details.dart';

class Returnlist extends StatefulWidget {
  const Returnlist({Key? key}) : super(key: key);

  @override
  State<Returnlist> createState() => _updatetest();
}

class _updatetest extends State<Returnlist> {
  @override
  String orderid = '';
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

  final _searchvalue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Expanded(
                    flex: 2,
                    child: Text(
                      "Order ID",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      "Status",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Expanded(flex: 2, child: Center(child: Text(""))),
                Expanded(
                    flex: 2,
                    child: Text(
                      "Date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: FutureBuilder<List>(
                future: fetchdata(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print('error in loading' + snapshot.error.toString());
                  }
                  if (snapshot.hasData) {
                    //print(snapshot.data);
                    return ReturnItemlist(
                      list: [snapshot.data],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class ReturnItemlist extends StatelessWidget {
  final List list;

  const ReturnItemlist({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // ignore: unnecessary_null_comparison
        itemCount: list == null ? 0 : list[0].length,
        itemBuilder: (context, i) {
          if (list[0][i]['status'].toString().toLowerCase() == 'pending' ||
              list[0][i]['status'].toString().toLowerCase() == 'returned') {
            return Container(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text(
                          list[0][i]['orderId'],
                          style: TextStyle(color: Colors.blue),
                        )),
                    Expanded(
                        flex: 2,
                        child: Text(
                          list[0][i]['status'],
                          style: TextStyle(color: colors(list[0][i]['status'])),
                        )),
                    Expanded(
                        flex: 2,
                        child: IconButton(
                          icon: Icon(Icons.more_horiz),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => DetailsCard(
                                  id: i,
                                ),
                              ),
                            );
                          },
                        )),
                    Expanded(
                        flex: 2, child: Text(Date(list[0][i]['createdAt']))),
                  ],
                ));
          } else if (i >= list[0].length) {
            return Container();
          } else {
            return Container();
          }
        });
  }
}
