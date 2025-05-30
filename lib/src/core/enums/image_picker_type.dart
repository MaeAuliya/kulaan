enum ImagePickerTypes {
  gallery,
  camera
}

class ImagePickerTypeEnums {
  // ImagePicker input type
  static const _gallery = 'gallery';
  static const _camera = 'camera';

  static ImagePickerTypes getTypes(String input) {
    switch (input) {
      case _gallery:
        return ImagePickerTypes.gallery;
      case _camera:
        return ImagePickerTypes.camera;
      default:
        return ImagePickerTypes.gallery;
    }
  }
}