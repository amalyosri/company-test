abstract class PhotoStates {}

class InitialToolsState extends PhotoStates {}

class GetGalleryImageSuccessState extends PhotoStates {}

class GetGalleryImageErrorState extends PhotoStates {}

class PostImageSuccessState extends PhotoStates {
  // String error;
  // GetHomeError(this.error);
}

class GetCameraImageSuccessState extends PhotoStates {}

class GetCameraImageErrorState extends PhotoStates {}

class AddImagesState extends PhotoStates {}
