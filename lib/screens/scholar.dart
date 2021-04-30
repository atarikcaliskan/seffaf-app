import 'package:flutter/material.dart';
import 'package:seffafapp/constants/data.dart';
import 'package:seffafapp/layouts/app.dart';
import 'package:seffafapp/utils/store.dart';
import 'package:seffafapp/widgets/postList.dart';

// ignore: must_be_immutable
class Scholar extends StatefulWidget {
  Scholar({Key key}) : super(key: key);

  @override
  _ScholarState createState() => _ScholarState();
}

class _ScholarState extends State<Scholar> {
  final store = new Store();
  List<dynamic> _posts = [];

  void initState() {
    super.initState();
    store.get('posts').then((value) => setState(() {
          _posts = [...value, ...mockPosts];
        }));
  }

  List<dynamic> handleFilter(List<dynamic> array, String targetName) {
    return array
        .where((element) => element['targetName'] == targetName)
        .toList();
  }

  void handleState(List<dynamic> newPost) {
    setState(() {
      _posts = [...newPost, ..._posts];
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeParams = ModalRoute.of(context).settings.arguments as Map;
    final filteredPosts = handleFilter(_posts, routeParams['name']);

    return AppLayout(
      pushedView: true,
      hasAddIcon: true,
      addIconOnTap: () {
        Navigator.pushNamed(context, '/addPost', arguments: {
          'handleState': handleState,
          'name': routeParams['name']
        });
      },
      children: Column(
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
                      backgroundImage: AssetImage(routeParams['image']),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                  child: Text(
                    routeParams['name'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 6, 0, 9),
                  child: Text(
                    routeParams['degree'],
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
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
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          'Tüm Gönderiler',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                filteredPosts.length > 0
                    ? Padding(padding: EdgeInsets.all(0))
                    : Column(
                        children: [
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
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade600),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
          filteredPosts.length > 0
              ? Expanded(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: PostList(posts: filteredPosts)))
              : Padding(padding: EdgeInsets.all(0))
        ],
      ),
    );
  }
}
