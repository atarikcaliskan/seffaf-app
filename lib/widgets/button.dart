import 'package:flutter/material.dart';
import 'package:seffafapp/constants/theme.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  Button({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.press,
    this.color = primaryColor,
    this.padding = const EdgeInsets.all(4 * 0.75),
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  final color;
  final EdgeInsets padding;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      padding: padding,
      color: color,
      minWidth: double.infinity,
      onPressed: onPressed,
      disabledColor: Colors.grey.shade400,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
