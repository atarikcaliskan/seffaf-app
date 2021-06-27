import 'package:flutter/material.dart';
import 'package:seffafapp/layouts/app.dart';
import 'package:seffafapp/services/auth.dart';
import 'package:seffafapp/utils/store.dart';
import 'package:seffafapp/widgets/button.dart';
import 'package:seffafapp/widgets/input.dart';

class AddPost extends StatefulWidget {
  AddPost({Key key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final store = new Store();
  String _title = '';
  String _description = '';
  dynamic _user = {};

  void initState() {
    super.initState();

    store.getCurrentUser().then((value) => setState(() {
          _user = value;
        }));
  }

  void handleAddPost(writingFor, routeParams) {
    final newPost = {
      'title': _title,
      'description': _description,
      'senderName': AuthService().userName ?? 'Bilinmeyen Kullanıcı',
      'targetName': writingFor,
    };

    store.set('posts', newPost).then((value) => {
          routeParams['handleState']([newPost]),
          Navigator.pushReplacementNamed(context, '/postDetail',
              arguments: newPost)
        });
  }

  @override
  Widget build(BuildContext context) {
    final routeParams = ModalRoute.of(context).settings.arguments as Map;
    final writingFor = routeParams['name'];

    return AppLayout(
      pushedView: true,
      children: Padding(
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(children: [
            Input(
              placeholder: 'Başlığı giriniz',
              onChanged: (titleInput) {
                setState(() {
                  _title = titleInput;
                });
              },
              label: 'Başlık',
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: Input(
                placeholder: 'Aklında neler var?',
                onChanged: (descriptionInput) {
                  setState(() {
                    _description = descriptionInput;
                  });
                },
                label: 'Açıklama',
                maxLines: 8,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Button(
                text: 'Paylaş',
                onPressed: () {
                  handleAddPost(writingFor, routeParams);
                },
                padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
              child: writingFor.length > 0
                  ? RichText(
                      text: TextSpan(
                          text: 'Şu an şu kişi için yazılıyor: ',
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade600),
                          children: [
                            TextSpan(
                              text: '$writingFor',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                    )
                  : null,
            ),
          ]),
        ),
      ),
    );
  }
}
