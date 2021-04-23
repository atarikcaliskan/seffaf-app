import 'package:flutter/material.dart';
import 'package:seffafapp/constants/theme.dart';
import 'package:seffafapp/screens/home.dart';
import 'package:seffafapp/screens/people.dart';
import 'package:seffafapp/screens/profile.dart';

// ignore: must_be_immutable
class AppLayout extends StatefulWidget {
  AppLayout({Key key, this.children, this.pushedView = false})
      : super(key: key);
  Widget children;
  bool pushedView;

  @override
  _AppLayoutState createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _selectedIndex = 0;

  final _pages = [Home(), People(), Profile()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var leadingPadding = widget.pushedView
        ? EdgeInsets.all(0)
        : EdgeInsets.fromLTRB(0, 20, 12, 8);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          leading: Padding(
            padding: leadingPadding,
            child: Container(
              height: 10,
              child: widget.pushedView
                  ? Container(
                      child: IconButton(
                      color: Colors.grey.shade500,
                      iconSize: 40,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: EdgeInsets.all(0),
                      icon: Icon(Icons.chevron_left_rounded),
                    ))
                  : Image.asset(
                      "assets/images/logo-text.png",
                      width: 500,
                    ),
            ),
          ),
          title: widget.pushedView
              ? Image.asset(
                  "assets/images/logo-text.png",
                  width: 90,
                )
              : null,
          leadingWidth: widget.pushedView ? 70 : 500,
          bottom: PreferredSize(
              child: Container(
                color: Colors.grey.shade300,
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(-10)),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
      ),
      body: widget.children ?? _pages[_selectedIndex],
      bottomNavigationBar: !widget.pushedView
          ? BottomNavigationBar(
              unselectedIconTheme: IconThemeData(color: Colors.black54),
              // showUnselectedLabels: true,
              unselectedLabelStyle: TextStyle(
                color: primaryColor,
              ),
              iconSize: 28,
              selectedIconTheme: IconThemeData(color: primaryColor),
              selectedItemColor: primaryColor,
              showSelectedLabels: false,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,

              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                  // backgroundColor: Colors.red,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people_outline),
                  label: 'Business',

                  // backgroundColor: Colors.green,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: 'School',
                  // backgroundColor: Colors.purple,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Settings',
                  // backgroundColor: Colors.pink,
                ),
              ],
            )
          : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Gönderi ekle',
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
      ),
    );
  }
}
