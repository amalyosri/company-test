// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'tools_state.dart';

class PhotoCubit extends Cubit<PhotoStates> {
  PhotoCubit() : super(InitialToolsState());

  static PhotoCubit get(context) => BlocProvider.of(context);

  late List images = [];

  File? galleryImage;
  var gallerypicker = ImagePicker();

  Future<void> getgalleryImage() async {
    final gallery = await gallerypicker.pickImage(
      source: ImageSource.gallery,
    );

    if (PickedFile != null) {
      galleryImage = File(gallery!.path);
      images.add(galleryImage);
      emit(GetGalleryImageSuccessState());
    } else {
      print('No image selected.');
      emit(GetGalleryImageErrorState());
    }
  }

  File? cameraImage;
  var camerapicker = ImagePicker();

  Future<void> getcameraImage() async {
    final camera = await camerapicker.pickImage(
      source: ImageSource.camera,
    );

    if (PickedFile != null) {
      cameraImage = File(camera!.path);
      images.add(cameraImage);
      emit(GetCameraImageSuccessState());
    } else {
      print('No image selected.');
      emit(GetCameraImageErrorState());
    }
  }
}
