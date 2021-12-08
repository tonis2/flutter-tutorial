import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MaterialApp(home: Blog()));
}

class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  BlogState createState() => BlogState();
}

class BlogState extends State<Blog> {
  List<Widget> posts = [];

  @override
  void initState() {
    super.initState();
    http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))
        .then((response) => {setState(() => posts = List<Widget>.from(json.decode(response.body).map((data) => Post.fromJson(data))))});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TEST"),
      ),
      body: Center(
          child: ListView(
        children: posts,
      )),
    );
  }
}

class Post extends StatelessWidget {
  final String title;
  final String body;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      body: json['body'],
    );
  }

  Post({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
      Text(
        body,
        style: const TextStyle(fontSize: 14),
      ),
      SizedBox(height: 30)
    ]);
  }
}
