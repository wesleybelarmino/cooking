import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      color: Colors.white,
      child: Center(
        child: Text(
          message,
          style: TextStyle(color: Colors.red[400]),
        ),
      ),
    );
  }
}
