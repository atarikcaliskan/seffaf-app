import 'package:flutter/material.dart';
import 'package:seffafapp/services/auth.dart';
import 'package:seffafapp/utils/fs.dart';
import 'package:seffafapp/utils/store.dart';
import 'package:seffafapp/utils/throwAlert.dart';
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

  void handleFormValidation() {
    AuthService().login(email: _email, password: _password).then((result) {
      if (result == null) {
        Navigator.pushNamedAndRemoveUntil(context, "/app", (r) => false);
        writeLog('Logged in');
      } else {
        writeLog(result);
        throwAlert(context, result);
      }
    });
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
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 72,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 48),
                    child: Text(
                      'Giriş Yap',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    )),
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
                  text: "Giriş Yap",
                  padding: const EdgeInsets.all(12),
                  onPressed: handleFormValidation,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    'Hesabınız yok mu? Kayıt olun!',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
