import 'package:construction/assets/Heading.dart';
import 'package:flutter/material.dart';
import '../assets/assets.dart';
import '../conditions/Fetch_Order.dart';


class orderlist extends StatefulWidget {


  @override
  State<orderlist> createState() => _updatetest();
}



class _updatetest extends State<orderlist> {

  @override

  Widget build(BuildContext context) {
    
    double hieght = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
          child: Heading()  ),
        Expanded(
          child: Container(
            child: FutureBuilder<List>(
                future: fetchdata(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print('error in loading' + snapshot.error.toString());
                  }
                  if (snapshot.hasData) {
                    print('error in loading' + snapshot.data.toString());
                      return Itemlist(
                      list: [snapshot.data],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ),
      ],
    );
  }
}

class Itemlist extends StatelessWidget {
  const Itemlist({Key? key, required this.list}) : super(key: key);

  final List list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // ignore: unnecessary_null_comparison
        itemCount: list == null ? 0 : list[0].length,
        itemBuilder: (context, i) {
          return Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        
                        },
                      )),
                  Expanded(flex: 2, child: Text(Date(list[0][i]['createdAt']))),
                ],
              ));
        });
  }
}




class search extends StatelessWidget {
  final List list;
  int value;

  search({Key? key, required this.list, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => orderlist()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Center(
                    child: Text(
                  list[0][value]['orderid'],
                  style: TextStyle(color: Colors.blue),
                ))),
            Expanded(
                flex: 2,
                child: Center(
                    child: Text(
                  list[0][value]['status'],
                  style: TextStyle(color: colors(list[0][value]['status'])),
                ))),
            Expanded(
                flex: 2,
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.more_horiz),
                    onPressed: () {
                      
                      //print(MediaQuery.of(context).size.width * 0.4);
                    },
                  ),
                )),
            Expanded(
                flex: 2, child: Center(child: Text(list[0][value]['date']))),
          ],
        ),
      ),
    );
  }
}
