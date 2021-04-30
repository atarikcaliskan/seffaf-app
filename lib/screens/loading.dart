import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:seffafapp/constants/theme.dart';
import 'package:seffafapp/utils/store.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final store = new Store();

  void checkLogin() async {
    await store
        .getCurrentUser()
        .then((value) => {
              if (value != null &&
                  value['isLoggedIn'] != null &&
                  value['isLoggedIn'])
                Timer(Duration(seconds: 1), () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/app", (r) => false);
                })
              else
                {
                  Timer(Duration(seconds: 1), () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/login", (r) => false);
                  })
                }
            })
        .catchError(
          (e) => {
            Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false)
          },
        );
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Image.asset(
                  'assets/images/logo-text-reverse.png',
                  height: 48,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: SpinKitRing(
                      lineWidth: 3,
                      color: Colors.white,
                      size: 50.0,
                    ))
              ]))),
    );
  }
}
