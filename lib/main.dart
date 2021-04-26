import 'package:flutter/material.dart';
import 'package:seffafapp/layouts/app.dart';
import 'package:seffafapp/screens/addPost.dart';
import 'package:seffafapp/screens/login.dart';
import 'package:seffafapp/screens/postDetail.dart';
import 'package:seffafapp/screens/register.dart';
import 'package:seffafapp/screens/stranger.dart';
import 'package:seffafapp/screens/notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Lato'),
      initialRoute: '/app',
      routes: {
        '/': (context) => Login(),
        '/register': (context) => Register(),
        '/app': (context) => AppLayout(),
        '/stranger': (context) => Stranger(),
        '/postDetail': (context) => PostDetail(),
        '/notifications': (context) => Notifications(),
        '/addPost': (context) => AddPost(),
      },
    );
  }
}
