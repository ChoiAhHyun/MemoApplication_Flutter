import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'add_page.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MemoApp'),
        actions: <Widget>[
          new IconButton(
            icon: Image.asset('assets/baseline_add_white_24.png'),
            onPressed: () => _addMemo(),
          ),
        ],
      ),
      backgroundColor: Colors.grey,
      body: StreamBuilder(
        stream: Firestore.instance
            .collection("memo")
            .orderBy("datetime", descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: const Text("Loading..."));
          }
          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return InkResponse(
                onTap: () =>
                    _clickMemo(snapshot.data.documents[index].documentID),
                child: Container(
                  margin: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 14, right: 14, top: 14),
                        child: Text(
                          snapshot.data.documents[index]["title"],
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          softWrap: false,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 14, right: 14, top: 14, bottom: 14),
                        child: Text(
                          snapshot.data.documents[index]["content"],
                          maxLines: 5,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: snapshot.data.documents.length,
          );
        },
      ),
    );
  }

  void _addMemo() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPage()),
    );
  }

  void _clickMemo(String documentID) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailPage(documentID: documentID)),
    );
  }
}
