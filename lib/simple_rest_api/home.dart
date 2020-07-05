import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final postData = "https://jsonplaceholder.typicode.com/posts";
  List data;
  bool check = true;
  @override
  void initState() {
    super.initState();
    getPostData();
  }

  getPostData() async {
    final res = await httpClient.get(postData);
    setState(() {
      check = false;
      print(res.body);
      data = json.decode(res.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Simple Rest Api"),
      ),
      body: check
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text(data[index]['title']),
                    subtitle: Text(data[index]['body']),
                  ),
                );
              },
            )),
    );
  }
}
