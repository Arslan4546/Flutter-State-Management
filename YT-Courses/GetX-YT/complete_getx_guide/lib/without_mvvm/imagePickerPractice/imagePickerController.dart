import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

class Imagepickercontroller extends GetxController {
  RxString imagePath = "".obs;

  Future GetImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }
}
