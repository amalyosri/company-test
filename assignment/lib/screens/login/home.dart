// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../componants/componant.dart';
import '../../cubit/tools_cubit.dart';
import '../../cubit/tools_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhotoCubit, PhotoStates>(
        listener: ((context, state) {}),
        builder: ((context, state) {
          File? galleryImage = PhotoCubit.get(context).galleryImage;
          return Scaffold(
            appBar: null,
            body: Stack(
              children: [
                Image.asset(
                  "assets/images/gellary3.png",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                const Align(
                  alignment: AlignmentDirectional(0.9, -0.93),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      "assets/images/Ellipse 1641.png",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome",
                          style: TextStyle(
                              color: HexColor("#4A4A4A"),
                              fontWeight: FontWeight.w400,
                              fontSize: 32)),
                      Text("Mina",
                          style: TextStyle(
                              color: HexColor("#4A4A4A"),
                              fontWeight: FontWeight.w400,
                              fontSize: 32)),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Group 17.png",
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text('log out',
                                    style: TextStyle(
                                        color: HexColor("#4A4A4A"),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20)),
                              ],
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  // Change your radius here
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                    backgroundColor: Colors.white54,
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        buttonElevated(
                                            text: "Gellary",
                                            image: "assets/images/gallery1.png",
                                            function: () {
                                              PhotoCubit.get(context)
                                                  .getgalleryImage();
                                              PhotoCubit.get(context)
                                                  .addgalleryimages();
                                            },
                                            color: HexColor("#EFD8F9")),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        buttonElevated(
                                            text: "Camera",
                                            image: "assets/images/3.png",
                                            function: () {
                                              PhotoCubit.get(context)
                                                  .getcameraImage();
                                              PhotoCubit.get(context)
                                                  .addcamerimages();
                                            },
                                            color: HexColor("#EBF6FF"))
                                      ],
                                    )),
                              );
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Group 14.png",
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text('upload',
                                    style: TextStyle(
                                        color: HexColor("#4A4A4A"),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20)),
                              ],
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  // Change your radius here
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Expanded(child: buildgridviwe(galleryImage, context))
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }

  Widget buildgridviwe(galleryImage, context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(
        PhotoCubit.get(context).images.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(PhotoCubit.get(context).images[index]!)
                      as ImageProvider,
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
