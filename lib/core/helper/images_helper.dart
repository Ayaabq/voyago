

import '../utils/confg.dart';

class ImagesHelper {
  static String fixUrl(String url) {

    // Check if the URL contains 'localhost' or '127.0.0.1'
    if (url.contains('localhost') || url.contains('127.0.0.1')) {
      // Extract the path after the port number
      Uri uri = Uri.parse(url);
      String path = uri.path;

      // Return the new URL with the base URL and the original path
      return "${Confg.baseUrl}$path";
    }

    // If the URL does not contain 'localhost' or '127.0.0.1', return it as is
    return url;
  }
}

