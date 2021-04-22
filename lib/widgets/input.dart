import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seffafapp/constants/theme.dart';

// ignore: must_be_immutable
class Input extends StatelessWidget {
  Input({
    Key key,
    @required this.placeholder,
    @required this.onChanged,
    // this.inputFormatters,
    this.label = '',
    this.isPassword = false,
  }) : super(key: key);

  final String label;
  final String placeholder;
  void Function(String) onChanged;
  // List<TextInputFormatter> inputFormatters;
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
          style: TextStyle(fontSize: 14),
          obscureText: isPassword,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
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
            contentPadding: const EdgeInsets.fromLTRB(12, 2, 12, 2),
            hintText: placeholder,
          ),
          keyboardType: TextInputType.number,
          // inputFormatters: inputFormatters,
        ),
      ),
    ]);
  }
}
