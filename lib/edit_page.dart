import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
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
              Navigator.of(context).pop(true);
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey,
      body: Container(
        child: Column(
          children: <Widget>[
            _buildTitleInput(),
            Expanded(
              child:
              _buildContentInput(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleInput() {
    return Container(
      child: TextField(
        //onChanged: (text) => _title = text,
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
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildContentInput() {
    return Container(
      margin: EdgeInsets.only(top: 1),
      child: TextField(
        //onChanged: (text) => _content = text,
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
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}