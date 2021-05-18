import 'package:http/http.dart' as http;

// ignore: non_constant_identifier_names
Future Getdata(url) async {
  // ignore: non_constant_identifier_names
  http.Response Response = await http.get(url);
  return Response.body;
}