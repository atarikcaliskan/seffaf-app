import 'package:flutter/material.dart';
import 'package:seffafapp/constants/theme.dart';
import 'package:seffafapp/screens/home.dart';
import 'package:seffafapp/screens/notifications.dart';
import 'package:seffafapp/screens/people.dart';
import 'package:seffafapp/screens/profile.dart';

// ignore: must_be_immutable
class AppLayout extends StatefulWidget {
  AppLayout({
    Key key,
    this.children,
    this.addIconOnTap,
    this.pushedView = false,
    this.hasAddIcon = false,
  }) : super(key: key);
  Widget children;
  bool pushedView;
  bool hasAddIcon;
  void Function() addIconOnTap;

  @override
  _AppLayoutState createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _selectedIndex = 0;

  final _pages = [Home(), People(), Notifications(), Profile()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          leading: Container(
            child: widget.pushedView
                ? Container(
                    child: IconButton(
                    color: Colors.grey.shade500,
                    iconSize: 38,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 4),
                    icon: Icon(Icons.chevron_left_rounded),
                  ))
                : Padding(
                    padding: EdgeInsets.fromLTRB(8, 16, 0, 8),
                    child: Image.asset(
                      "assets/images/logo-text.png",
                      width: 90,
                    ),
                  ),
          ),
          title: widget.pushedView
              ? Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Image.asset(
                    "assets/images/logo-text.png",
                    width: 90,
                  ))
              : null,
          leadingWidth: widget.pushedView ? 50 : 500,
          actions: [
            _selectedIndex == 3
                ? IconButton(
                    icon: Icon(Icons.settings,
                        color: Colors.grey.shade600, size: 26),
                    onPressed: () {
                      Navigator.pushNamed(context, '/settings');
                    })
                : Padding(padding: EdgeInsets.all(0))
          ],
          bottom: PreferredSize(
              child: Container(
                color: Colors.grey.shade300,
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(10)),
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
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school_outlined),
                  label: 'Scholars',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_none_rounded),
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                ),
              ],
            )
          : null,
      floatingActionButton: widget.hasAddIcon
          ? FloatingActionButton(
              onPressed: () {
                widget.addIconOnTap();
              },
              tooltip: 'Gönderi ekle',
              backgroundColor: primaryColor,
              child: Icon(Icons.add),
            )
          : null,
    );
  }
}
