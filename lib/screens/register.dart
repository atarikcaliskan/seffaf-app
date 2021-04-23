import 'package:flutter/material.dart';
import 'package:seffafapp/screens/home.dart';
import 'package:seffafapp/widgets/button.dart';
import 'package:seffafapp/widgets/input.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _fullName = '';
  String _email = '';
  String _password = '';

  void handleFormValidation() {
    if (_password.length > 8 && _email.length > 0 && _fullName.length > 0) {
      var data = {
        'currentUser': {
          'fullName': _fullName,
          'email': _email,
          'password': _password
        }
      };

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
            settings: RouteSettings(
              arguments: data,
            ),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _disabled = true;
    if (_password.length > 8 && _email.length > 0 && _fullName.length > 0) {
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
                    label: 'Isim Soyisim:',
                    placeholder: 'Isim soyisim giriniz',
                    onChanged: (fullNameInput) {
                      setState(() {
                        _fullName = fullNameInput;
                      });
                    }),
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
                    isPassword: true,
                    onChanged: (passwordInput) {
                      setState(() {
                        _password = passwordInput;
                      });
                    }),
              ),
              Button(
                text: "Kayıt Ol",
                onPressed: _disabled ? null : handleFormValidation,
                padding: const EdgeInsets.all(12),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text('Hesabınız var mı? Giriş yapın!'),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
