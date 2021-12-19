import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final String title;
  final String body;
  const Post({Key? key, required this.title, required this.body}) : super(key: key);

  // Used to create Post class from JSON
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      body: json['body'],
    );
  }

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
      const SizedBox(height: 30)
    ]);
  }
}
