import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class ProfileSettingsController extends GetxController {
  File? _image;
  final picker = ImagePicker();

  Future<void> getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _image = File(pickedImage.path);
      update();
    }
  }

  File? get image => _image;

  @override
  void onInit() {
    super.onInit();

  }
}