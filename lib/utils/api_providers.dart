import 'package:http/http.dart' as http;

class Apiprovider {
  Future<http.Response> userdata() async {
    final response = await http.get(
      Uri.parse('https://mocki.io/v1/6a813f72-cff2-4f46-ab59-388361d28f4e'),
    );
    return response;
  }
}
