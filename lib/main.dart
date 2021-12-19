import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './post.dart';

void main() {
  runApp(const MaterialApp(home: Blog()));
}

// Elements that use mutable state need to be wrapped with StatefulWidget, that can rerender UI when state changes
class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  BlogWidget createState() => BlogWidget();
}

class BlogWidget extends State<Blog> {
  List<Widget> posts = [];

  @override
  void initState() {
    super.initState();

    // Download posts json data from jsonplaceholder API
    http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts')).then((response) => {
          // set State makes the UI rerender posts list
          setState(() => {
                // Parse jsonplaceholder data with json decode and then convert the data into flutter widgets
                posts = List<Widget>.from(json.decode(response.body).map((data) => Post.fromJson(data)))
              })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("APP TITLE"),
      ),
      body: Center(
          child: ListView(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
        children: posts,
      )),
    );
  }
}
