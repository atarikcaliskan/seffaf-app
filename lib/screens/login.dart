import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';
import 'package:seffafapp/utils/store.dart';
import 'package:seffafapp/widgets/button.dart';
import 'package:seffafapp/widgets/input.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email = '';
  String _password = '';
  final store = Store();
  final _db = Localstore.instance;

  void handleFormValidation() {
    store.get('users').then((value) => value.forEach((e) => {
          if (_email == e['email'] && _password == e['password'])
            _db
                .collection('users')
                .doc(e['id'])
                .set({...e, 'isLoggedIn': true}).then(
                    (value) => Navigator.pushNamed(context, '/app'))
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 64),
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 72,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: Input(
                      label: 'Email Adresiniz:',
                      placeholder: 'Email adresinizi giriniz',
                      onChanged: (emailInput) {
                        setState(() {
                          _email = emailInput;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: Input(
                      label: 'Sifreniz:',
                      placeholder: 'Sifrenizi giriniz',
                      onChanged: (passwordInput) {
                        setState(() {
                          _password = passwordInput;
                        });
                      }),
                ),
                Button(
                  text: "Giriş Yap",
                  padding: const EdgeInsets.all(12),
                  onPressed: handleFormValidation,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text('Hesabınız yok mu? Kayıt olun!'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
