import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<XFile?> getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    return image;
  }
}
