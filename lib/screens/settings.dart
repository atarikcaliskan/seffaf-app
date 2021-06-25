import 'package:flutter/material.dart';
import 'package:seffafapp/layouts/app.dart';
import 'package:seffafapp/services/auth.dart';
import 'package:seffafapp/utils/fs.dart';
import 'package:seffafapp/utils/store.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final store = Store();

  void handleLogout() {
    AuthService().logout().then((value) =>
        Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false));
    writeLog('Logged out');
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      pushedView: true,
      children: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            padding: EdgeInsets.fromLTRB(4, 8, 4, 4),
            itemCount: 1,
            itemBuilder: (context, i) {
              return ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/scholar');
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                        child: IconButton(
                          icon: Icon(Icons.logout),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            handleLogout();
                          },
                          color: Colors.grey.shade700,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            handleLogout();
                          },
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: Text(
                            'Çıkış yap',
                            style: TextStyle(color: Colors.grey.shade700),
                          )),
                    ]),
                  ],
                ),
              );
            },
          ),
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(32, 48, 32, 0),
                  child: Text(
                    'Hakkında',
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Text(
                    'Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 193311008 numaralı Abdullah Tarık Çalışkan tarafından 25 Haziran 2021 günü yapılmıştır.',
                    style: TextStyle(color: Colors.grey.shade700)),
              )
            ],
          )
        ],
      ),
    );
  }
}
