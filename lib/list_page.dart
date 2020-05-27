import 'package:flutter/material.dart';
import 'edit_page.dart';

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
          new IconButton(icon: Image.asset('assets/baseline_add_white_24.png'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditPage()),
                );
              },
          ),
        ],
      ),
      backgroundColor: Colors.grey,
    );
  }
}
