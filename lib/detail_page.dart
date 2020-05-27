import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'edit_page.dart';

class DetailPage extends StatefulWidget {
  final String documentID;

  DetailPage({Key key, @required this.documentID}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _titleText = "", _contentText = "";

  @override
  Widget build(BuildContext context) {
    _getValues();
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
            onPressed: () => _deleteMemo(),
          ),
          IconButton(
            icon: Image.asset('assets/baseline_edit_white_24.png'),
            onPressed: () => _editMemo(),
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
              _titleText,
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
                _contentText,
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

  void _getValues() {
    Firestore.instance
        .collection("memo")
        .document(widget.documentID)
        .get()
        .then((document) {
      setState(() {
        _titleText = document["title"];
        _contentText = document["content"];
      });
    });
  }

  void _deleteMemo() {
    Firestore.instance.collection("memo").document(widget.documentID).delete();
    Navigator.pop(context);
  }

  void _editMemo() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditPage(documentID: widget.documentID)),
    );
  }

}
