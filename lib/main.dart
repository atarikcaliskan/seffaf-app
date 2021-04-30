import 'package:flutter/material.dart';
import 'package:seffafapp/layouts/app.dart';
import 'package:seffafapp/screens/addPost.dart';
import 'package:seffafapp/screens/loading.dart';
import 'package:seffafapp/screens/login.dart';
import 'package:seffafapp/screens/postDetail.dart';
import 'package:seffafapp/screens/register.dart';
import 'package:seffafapp/screens/settings.dart';
import 'package:seffafapp/screens/scholar.dart';
import 'package:seffafapp/screens/notifications.dart';
import 'package:seffafapp/utils/store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final store = new Store();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Şeffaf',
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: '/loading',
      routes: {
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/app': (context) => AppLayout(),
        '/scholar': (context) => Scholar(),
        '/postDetail': (context) => PostDetail(),
        '/notifications': (context) => Notifications(),
        '/addPost': (context) => AddPost(),
        '/settings': (context) => Settings(),
        '/loading': (context) => Loading(),
      },
    );
  }
}
