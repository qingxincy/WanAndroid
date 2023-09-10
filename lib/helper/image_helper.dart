import 'dart:math';

class ImageHelper {

  static List<String> imageUrl = [];

  static String randomUrl() {
    return imageUrl[Random().nextInt(imageUrl.length)];
  }
}