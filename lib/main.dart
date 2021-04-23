import 'package:flutter/material.dart';
import 'package:seffafapp/constants/theme.dart';
import 'package:seffafapp/screens/login.dart';
import 'package:seffafapp/screens/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Lato'),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/register': (context) => Register(),
        '/home': (context) => Login(),
        // '/hakkinda': (context) => Hakkinda(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

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
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 12, 8),
            child: Container(
              height: 10,
              child: Image.asset(
                "assets/images/logo-text.png",
                width: 500,
              ),
            ),
          ),
          leadingWidth: 500,
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
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Burada yeller esiyor.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  'İlk sen ol!',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Geri bildirim ekle',
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
      ),
    );
  }
}
