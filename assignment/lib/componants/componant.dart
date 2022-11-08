// ignore_for_file: constant_identifier_names, sort_child_properties_last, camel_case_types, prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import 'constunt.dart';

// ignore: non_constant_identifier_names
void finash_navigate(context, widgit) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widgit), (route) => false);
}

void fluttertost(msg, toststate state) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: changecolortost(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum toststate {
  Error,
  Success,
  Warning,
}

Color changecolortost(toststate state) {
  var color;

  switch (state) {
    case toststate.Error:
      color = Colors.red;
      break;

    case toststate.Success:
      color = Colors.green;
      break;

    case toststate.Warning:
      color = Colors.yellow;
      break;
  }

  return color;
}

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Future navigateto(context, widget) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => widget));
}

Widget buttonElevated({function, text, image, required Color color}) {
  return ButtonTheme(
    height: 100.0,
    child: ElevatedButton(
      onPressed: function,
      child: Row(
        children: [
          Image.asset(
            image,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(text,
              style: TextStyle(
                  color: HexColor("#4A4A4A"),
                  fontWeight: FontWeight.w600,
                  fontSize: 20)),
        ],
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(184, 65),
          backgroundColor: color,
          shape: const StadiumBorder()),
    ),
  );
}
