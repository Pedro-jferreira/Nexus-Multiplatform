import 'package:http/http.dart' as http;
import 'dart:typed_data';

Future<Uint8List?> getByteArrayFromUrl(String url) async {
  try {
    final http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
  } catch (e) {
    print('Erro ao baixar imagem: $e');
  }
  return null;
}