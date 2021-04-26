import 'package:flutter/material.dart';
import 'package:seffafapp/widgets/button.dart';

class Notifications extends StatefulWidget {
  Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_paused_rounded,
              size: 200,
              color: Colors.grey.shade500,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
              child: Text(
                  'ZzZzz... Henüz hiç bildirimin yok. \n Bildirimler için geliştirici ile iletişime geç!',
                  textAlign: TextAlign.center),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 48, 0, 0),
              child: Button(text: 'İletişime Geç', onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
