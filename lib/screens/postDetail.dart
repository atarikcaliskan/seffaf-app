import 'package:flutter/material.dart';
import 'package:seffafapp/layouts/app.dart';

class PostDetail extends StatefulWidget {
  PostDetail({Key key}) : super(key: key);

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    final routeParams = ModalRoute.of(context).settings.arguments as Map;
    final senderName = routeParams['senderName'];
    final senderImage = 'https://robohash.org/$senderName.png';
    final targetName = routeParams['targetName'];

    return AppLayout(
      pushedView: true,
      children: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(32, 32, 0, 32),
          child: Column(
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: routeParams['isImageUrl'] != null &&
                              routeParams['isImageUrl']
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
                        Container(
                          constraints: BoxConstraints(maxWidth: 240),
                          child: Text(
                            '$senderName > $targetName',
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.bold),
                          ),
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
                  padding: EdgeInsets.fromLTRB(0, 24, 12, 4),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 240),
                    child: Text(
                      routeParams['title'],
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ]),
              Row(children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 6, 12, 4),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 280),
                    child: Text(
                      routeParams['description'],
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 24, 8, 4),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                        child: Icon(Icons.arrow_upward_outlined,
                            color: Colors.green.shade600),
                      ),
                      Icon(
                        Icons.arrow_downward_outlined,
                        color: Colors.red.shade600,
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 8, 24),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(3, 0, 24, 0),
                        child: Text('32',
                            style: TextStyle(color: Colors.green.shade600)),
                      ),
                      Text('11', style: TextStyle(color: Colors.red.shade600)),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 32, 0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 0.6,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 32, 32, 0),
                child: Column(
                  children: [
                    Icon(
                      Icons.waves,
                      size: 102,
                      color: Colors.grey.shade400,
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                        child: Text('Henüz yorum yok. İlk yorumu sen yaz!'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
