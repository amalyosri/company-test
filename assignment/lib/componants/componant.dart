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

// void finesh(context, widget) {
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute<void>(
//       builder: (BuildContext context) => widget,
//     ),
//   );
// }

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

Widget textfeild(controller, label, prefixicon, type, validate, {onchang}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: prefixicon,
      border: const OutlineInputBorder(),
    ),
    keyboardType: type,
    validator: validate,
    onChanged: onchang,
  );
}

Widget defaultButton(
    {required String? text,
    required function,
    bool isuppercase = true,
    color,
    radius = 5.0,
    required context}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: color ?? Theme.of(context).primaryColor,
    ),
    height: 40,
    width: double.infinity,
    child: MaterialButton(
      child: Text(
        isuppercase ? text!.toUpperCase() : text!,
        style: const TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
      onPressed: function,
    ),
  );
}

Future navigateto(context, widget) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => widget));
}

// AppBar appbar({title, context, List<Widget>? actions}) {
//   return AppBar(
//     titleSpacing: 0.0,
//     title: Text(title),
//     leading: IconButton(
//       onPressed: () {
//         Navigator.pop(context);
//       },
//       icon: const Icon(IconBroken.Arrow___Left_2),
//     ),
//     actions: actions,
//   );
// }

////////////////////////////////////////////////////////////////////////componant Tools App

datetime(String date) {
  var time = DateFormat("MMM d, yyyy").format(DateTime.parse(date));
  return time;
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

      // ButtonStyle(
      //   backgroundColor: MaterialStateProperty.all<Color>(color),
      //   shape: MaterialStateProperty.all(
      //     RoundedRectangleBorder(
      //       // Change your radius here
      //       borderRadius: BorderRadius.circular(16),
      //     ),
      //   ),
      // ),
    ),
  );
}
