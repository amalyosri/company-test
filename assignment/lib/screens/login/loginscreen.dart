// ignore_for_file: non_constant_identifier_names, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../componants/componant.dart';
import '../../dio_helper/cashe_helper.dart';
import 'home.dart';
import 'login cubit/lodin_status.dart';
import 'login cubit/lodingcubit.dart';

class Login_Screen extends StatelessWidget {
  Login_Screen({Key? key}) : super(key: key);
  var formkey = GlobalKey<FormState>();
  var email_controller = TextEditingController();
  var pass_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Cubitlogin(),
      child: BlocConsumer<Cubitlogin, LoginStates>(
        listener: (context, state) {
          // if (state is LoginSuccess) {
          //   if (state.loginmodel.status == true) {
          //     CacheHelper.savedata(
          //             key: "token", value: state.loginmodel.apiToken)
          //         .then((value) {
          //      // finash_navigate(context, HomeScreen());
          //      // token = state.loginmodel.apiToken;
          //     });
          //   } else {
          //     // fluttertost("These credentials do not match our records.",
          //     //     toststate.Error);
          //   }
          // }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: null,
            body: Stack(
              children: [
                Image.asset(
                  "assets/images/log in.png",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text("My",
                              style: TextStyle(
                                  color: HexColor("#4A4A4A"),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50)),
                          Text("Gellary ",
                              style: TextStyle(
                                  color: HexColor("#4A4A4A"),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50)),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(32)),
                            padding: const EdgeInsets.all(30.0),
                            child: Form(
                              key: formkey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Log in",
                                      style: TextStyle(
                                          color: HexColor("#4A4A4A"),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 35)),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller: email_controller,
                                    decoration: InputDecoration(
                                      labelText: "Email",
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                          //  width: 2.0,
                                        ),
                                      ),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    onFieldSubmitted: (val) {
                                      print(val);
                                    },
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "email must not empty";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: pass_controller,
                                    decoration: InputDecoration(
                                        labelText: "Password",
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            //  width: 2.0,
                                          ),
                                        ),
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              Cubitlogin.get(context)
                                                  .changepassicon();
                                            },
                                            icon: Icon(Cubitlogin.get(context)
                                                .passicon))),
                                    obscureText: Cubitlogin.get(context).ispass,
                                    keyboardType: TextInputType.text,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "pass must not be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Container(
                                        width: double.infinity,
                                        child: Conditional.single(
                                            context: context,
                                            conditionBuilder:
                                                (BuildContext context) {
                                              return state is! Loginloding;
                                            },
                                            widgetBuilder: (context) {
                                              return InkWell(
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: HexColor(
                                                            "##7BB3FF"),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    height: 60,
                                                    child: const Center(
                                                        child: Text(
                                                      "SUBMIT",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ))),
                                                onTap: () {
                                                  navigateto(context,
                                                      const HomeScreen());
                                                  if (formkey.currentState!
                                                      .validate()) {
                                                    Cubitlogin.get(context)
                                                        .userlogin(
                                                            email:
                                                                email_controller
                                                                    .text,
                                                            pass:
                                                                pass_controller
                                                                    .text);
                                                    //   // finash_navigate(
                                                    //   //     context, SocialLayout());
                                                  }

                                                  // finash_navigate(
                                                  //     context, SocialLayout());
                                                },
                                              );
                                            },
                                            fallbackBuilder:
                                                (BuildContext context) {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            })),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
