import 'package:flutter/material.dart';
import 'package:seffafapp/constants/data.dart';
import 'package:seffafapp/utils/store.dart';
import 'package:seffafapp/widgets/postList.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final store = new Store();
  List<dynamic> _posts = [];

  void initState() {
    super.initState();
    store.get('posts').then((value) => setState(() {
          _posts = [...value, ...mockPosts];
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Container(child: _posts.length > 0 ? PostList(posts: _posts) : null),
    );
  }
}
