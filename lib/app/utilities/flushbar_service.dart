import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utils {
  showBasicFlushBar(
    BuildContext context, {
    String content,
    Color textColor,
    Icon icon,
  }) {
    Flushbar(
      animationDuration: Duration(milliseconds: 400),
      duration: Duration(seconds: 2),
      isDismissible: false,
      backgroundColor: Colors.white70,
      borderRadius: 10,
      flushbarStyle: FlushbarStyle.FLOATING,
      icon: icon ??
          Icon(
            Icons.info_outline_rounded,
            color: Colors.green,
          ),
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      messageText: Text(
        content,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    )..show(context);
  }
}
