import 'dart:convert';
import 'package:http/http.dart' as http;

class ServiceData {
  final String id;
  final String name;
  final String description;

  ServiceData(
      {required this.id, required this.name, required this.description});

  factory ServiceData.fromJson(Map<String, dynamic> json) {
    return ServiceData(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}

Future<List<ServiceData>> fetchServiceData() async {
  const String url = 'https://saco.newtechplc.com/service.json';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((data) => ServiceData.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}
