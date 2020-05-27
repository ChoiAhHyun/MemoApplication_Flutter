import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

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
            icon: Image.asset('assets/baseline_done_white_24.png'),
            onPressed: () {
              Firestore.instance.collection("memo").add({
                "title": _titleController.text,
                "content": _contentController.text,
                "datetime": Timestamp.now(),
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildTitleInput(),
          Expanded(
            child: _buildContentInput(),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleInput() {
    return Container(
      padding: EdgeInsets.only(left: 14, right: 14, top: 4, bottom: 4),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: TextField(
        controller: _titleController,
        maxLines: 1,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          hintText: "제목을 입력해주세요",
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: 18,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildContentInput() {
    return Container(
      margin: EdgeInsets.only(top: 1),
      padding: EdgeInsets.only(left: 14, right: 14, top: 4, bottom: 4),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: TextField(
        controller: _contentController,
        expands: true,
        maxLines: null,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
        decoration: InputDecoration(
          hintText: "내용을 입력해주세요",
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
