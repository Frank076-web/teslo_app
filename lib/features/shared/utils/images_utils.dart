import 'package:teslo_app/config/config.dart';

class ImagesUtils {
  static String parseImageUrl([String? url]) {
    if (url == null || url.isEmpty) return '';

    if (url.startsWith('http')) {
      return url;
    }

    return '${Enviroment.apiUrl}/files/product/$url';
  }
}
