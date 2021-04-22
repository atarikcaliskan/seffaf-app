import 'package:flutter/material.dart';
import 'package:seffafapp/main.dart';
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

  void handleFormValidation() {
    if (_password.length > 8 && _email.length > 0) {
      var data = {
        'currentUser': {'email': _email, 'password': _password}
      };

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
            settings: RouteSettings(
              arguments: data,
            ),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _disabled = true;
    if (_password.length > 8 && _email.length > 0) {
      _disabled = false;
    } else {
      _disabled = true;
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Spacer(flex: 2),
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
                    label: 'Şifreniz:',
                    placeholder: 'Şifrenizi giriniz',
                    onChanged: (passwordInput) {
                      setState(() {
                        _password = passwordInput;
                      });
                    }),
              ),
              Button(
                text: "Giriş Yap",
                padding: const EdgeInsets.all(12),
                onPressed: _disabled ? null : handleFormValidation,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('Hesabınız yok mu? Kayıt olun!'),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
