import 'package:http/http.dart' as http;
import 'package:mechine_test_playspots/utils/api_providers.dart';

class Apirepository {
  final Apiprovider apiprovider = Apiprovider();
  Future<http.Response> exchangedata() async {
    return apiprovider.userdata();
  }
}
