import 'package:flutter/material.dart';
import 'package:seffafapp/layouts/app.dart';
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

  @override
  Widget build(BuildContext context) {
    final routeParams = ModalRoute.of(context).settings.arguments as Map;
    final writingFor = routeParams['name'];

    void handleAddPost() {
      final newPost = {
        'title': _title,
        'description': _description,
        'senderName': 'Tarık Çalışkan',
        'targetName': writingFor,
      };

      store.set('posts', newPost).then((value) => {
            routeParams['handleState']([newPost]),
            Navigator.pushReplacementNamed(context, '/postDetail',
                arguments: newPost)
          });
    }

    return AppLayout(
      pushedView: true,
      children: Padding(
        padding: EdgeInsets.all(32),
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
                handleAddPost();
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
    );
  }
}
