// ignore_for_file: avoid_print

import 'package:hexcolor/hexcolor.dart';

String? token;
var defaultcolor = HexColor("#00ADEF");
void printfulltext(String text) {
  final pattern = RegExp('.{1.800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

//  TextButton(child:Text("logout") ,
//      onPressed: (){
//       CacheHelper.removedata("token").then((value) =>
//     if(value==true){ finash_navigate(context, login_screen()));}
    
//      },)