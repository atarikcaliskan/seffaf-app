import 'package:flutter/material.dart';
import 'package:seffafapp/layouts/app.dart';
import 'package:seffafapp/services/api.dart';
import 'package:seffafapp/services/auth.dart';
import 'package:seffafapp/utils/store.dart';
import 'package:seffafapp/widgets/button.dart';
import 'package:seffafapp/widgets/input.dart';

class AddBranch extends StatefulWidget {
  AddBranch({Key key}) : super(key: key);

  @override
  _AddBranchState createState() => _AddBranchState();
}

class _AddBranchState extends State<AddBranch> {
  final store = new Store();
  String _branch = '';

  void handleSubmit(branch) {
    ApiService()
        .setUserBranch(AuthService().email, branch)
        .then((value) => Navigator.pushReplacementNamed(context, '/app'));
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      pushedView: true,
      children: Padding(
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(children: [
            Input(
              placeholder: 'Bölümünüzü giriniz',
              onChanged: (branchInput) {
                setState(() {
                  _branch = branchInput;
                });
              },
              label: 'Bölümünüz',
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Button(
                text: 'Kaydet',
                onPressed: () {
                  handleSubmit(_branch);
                },
                padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
