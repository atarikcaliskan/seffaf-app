import 'package:flutter/material.dart';
import 'package:seffafapp/constants/data.dart';
import 'package:seffafapp/services/auth.dart';
import 'package:seffafapp/utils/store.dart';
import 'package:seffafapp/widgets/postList.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final store = new Store();
  List<dynamic> _posts = [];
  bool _isLoading = true;

  void initState() {
    super.initState();
    store
        .get('posts')
        .then((value) => setState(() {
              _posts = [...value, ...mockPosts];
            }))
        .then((value) => setState(() {
              _isLoading = false;
            }));
  }

  List<dynamic> handleFilter(List<dynamic> array) {
    return array
        .where((element) => element['senderName'] == AuthService().userName)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredPosts =
        AuthService().userName.length > 0 ? handleFilter(_posts) : [];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(99.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                child: Text(
                  AuthService().userName ?? '',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        offset: Offset(0.0, 20.0),
                        blurRadius: 8.0,
                        spreadRadius: 3.0,
                      )
                    ],
                  ),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Text(
                        'Tüm Gönderiler',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ])),
              filteredPosts.length > 0
                  ? Padding(padding: EdgeInsets.all(0))
                  : !_isLoading
                      ? Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
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
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey.shade600),
                              ),
                            ),
                          ],
                        )
                      : Padding(
                          padding: EdgeInsets.all(0),
                        )
            ],
          ),
        ),
        filteredPosts.length > 0
            ? Expanded(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: PostList(posts: filteredPosts)))
            : Padding(padding: EdgeInsets.all(0))
      ],
    );
  }
}
