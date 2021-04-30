import 'package:flutter/material.dart';
import 'package:seffafapp/constants/theme.dart';

// ignore: must_be_immutable
class Input extends StatelessWidget {
  Input({
    Key key,
    @required this.placeholder,
    @required this.onChanged,
    this.maxLines = 1,
    this.label = '',
    this.isPassword = false,
  }) : super(key: key);

  final String label;
  final String placeholder;
  final int maxLines;
  void Function(String) onChanged;
  bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: Text(label),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(0, label.length > 0 ? 8 : 0, 0, 0),
        child: TextFormField(
          onChanged: (text) {
            onChanged(text);
          },
          maxLines: maxLines,
          style: TextStyle(fontSize: 13),
          obscureText: isPassword,
          decoration: InputDecoration(
              contentPadding: maxLines > 1
                  ? EdgeInsets.fromLTRB(14, 34, 8, 8)
                  : EdgeInsets.fromLTRB(14, 0, 8, 0),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              fillColor: inputBackground,
              filled: true,
              hintText: placeholder,
              hintStyle: TextStyle()),
        ),
      ),
    ]);
  }
}
