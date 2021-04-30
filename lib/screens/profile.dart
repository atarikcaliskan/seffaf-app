import 'package:flutter/material.dart';
import 'package:seffafapp/constants/data.dart';
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
  dynamic _user = {};

  void initState() {
    super.initState();
    store.get('posts').then((value) => setState(() {
          _posts = [...value, ...mockPosts];
        }));

    store.getCurrentUser().then((value) => setState(() {
          _user = value;
        }));
  }

  List<dynamic> handleFilter(List<dynamic> array, String targetName) {
    return array
        .where((element) => element['senderName'] == targetName)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredPosts = _user['fullName'] != null
        ? handleFilter(_posts, _user['fullName'])
        : [];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 12),
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
                  _user['fullName'] ?? '',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                child: Text(
                  _user['branch'] ?? '',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 6, 0, 32),
                child: Text(
                  _user['college'] ?? '',
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
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Text(
                  'Tüm Gönderiler',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.bold),
                ),
              ),
              filteredPosts.length > 0
                  ? Padding(padding: EdgeInsets.all(0))
                  : Column(
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
