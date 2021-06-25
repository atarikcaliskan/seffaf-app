import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final throwAlert = (context, String data) => showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Text(data),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
