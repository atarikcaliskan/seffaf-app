import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 72),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/user.png",
                height: 120,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                child: Text(
                  'Tarik Caliskan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                child: Text(
                  'Bilgisayar Mühendisliği İ.Ö.',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 6, 0, 32),
                child: Text(
                  'Teknoloji Fakültesi',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 0.6,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Text(
                  'Gönderilerim',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 82, 0, 0),
                child: Icon(
                  Icons.waves,
                  size: 96,
                  color: Colors.grey.shade400,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Text(
                  'Burası çok ıssız. Bir gönderi paylaş.',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
