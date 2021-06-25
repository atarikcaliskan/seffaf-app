import 'package:flutter/material.dart';
import 'package:seffafapp/services/auth.dart';
import 'package:seffafapp/utils/fs.dart';
import 'package:seffafapp/utils/store.dart';
import 'package:seffafapp/widgets/button.dart';
import 'package:seffafapp/widgets/input.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _email = '';
  String _password = '';
  String _fullName = '';

  final store = new Store();

  void handleFormValidation() {
    if (_password.length > 5 && _email.length > 0) {
      AuthService()
          .register(email: _email, password: _password, fullName: _fullName)
          .then((result) {
        if (result == null) {
          writeLog('Register completed');
          Navigator.pushNamedAndRemoveUntil(context, "/app", (r) => false);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _disabled = true;
    if (_password.length > 5 && _email.length > 0) {
      _disabled = false;
    } else {
      _disabled = true;
    }
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(32, 12, 32, 32),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 72,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                  child: Text(
                    'Kayıt ol',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: Input(
                    label: 'İsim Soyisim:',
                    placeholder: 'İsim soyisminizi giriniz',
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
                    label: 'Şifreniz:',
                    placeholder: 'Şifrenizi giriniz',
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
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  'Hesabınız mı var? Giriş yapın!',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
