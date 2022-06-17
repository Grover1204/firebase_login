import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String data) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.blue[200],
      content: Text(
        data,
        style: TextStyle(
          color: Colors.red,
          fontSize: 24,
        ),
      ),
    ),
  );
}
