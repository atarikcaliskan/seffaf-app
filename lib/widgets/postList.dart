import 'package:flutter/material.dart';
import 'package:seffafapp/constants/data.dart';
import 'package:seffafapp/screens/postDetail.dart';

// ignore: must_be_immutable
class PostList extends StatefulWidget {
  PostList({Key key, @required this.posts}) : super(key: key);
  List<dynamic> posts;

  @override
  PostListState createState() => PostListState();
}

class PostListState extends State<PostList> {
  Widget _buildRow(dynamic post) {
    final senderName = post['senderName'];
    final targetName = post['targetName'];
    final title = post['title'];
    final description = post['description'];
    final senderImage = 'https://robohash.org/$senderName.png';

    return ListTile(
      onTap: () {
        var data = {
          'senderName': senderName,
          'targetName': targetName,
          'title': title,
          'description': description,
          'isImageUrl': mockPeople.contains(senderName)
        };
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostDetail(),
              settings: RouteSettings(
                arguments: data,
              ),
            ));
      },
      title: Padding(
        padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: mockPeople.contains(senderName)
                        ? NetworkImage(senderImage)
                        : AssetImage('assets/images/user.png'),
                    backgroundColor: Colors.grey.shade400,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '$senderName > $targetName',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                      child: Text(
                        'az önce',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
            Row(children: [
              Padding(
                padding: EdgeInsets.fromLTRB(52, 12, 4, 4),
                child: Text(
                  '$title',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            Row(children: [
              Padding(
                padding: EdgeInsets.fromLTRB(52, 6, 0, 4),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 240),
                  child: Text(
                    '$description',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildList(dynamic posts) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      padding: EdgeInsets.fromLTRB(4, 8, 4, 4),
      itemCount: posts.length,
      itemBuilder: (context, i) {
        return _buildRow(posts[i]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildList(widget.posts);
  }
}
