import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String documentID;

  DetailPage({Key key, @required this.documentID}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MemoApp'),
        leading: IconButton(
          icon: Image.asset('assets/baseline_arrow_back_white_24.png'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/baseline_delete_white_24.png'),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/baseline_edit_white_24.png'),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.grey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 14, right: 14, top: 20, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Text(
              widget.documentID,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 1),
              padding: EdgeInsets.only(left: 14, right: 14, top: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                widget.documentID,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
