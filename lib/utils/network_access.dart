import 'dart:convert';
import 'package:amarach/utils/constant_net.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchData(apiEnd) async {
  final url = Uri.parse('$getData/$apiEnd');
  try {
    final response = await http.get(url,headers: headers);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> books = data['Data'];
      return books;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
