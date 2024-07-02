import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projectakhir/domain/model/lost_item_model.dart';

class LostItemService {
  static const String baseUrl = 'http://localhost:8000/api/lost-items';

  Future<List<LostItem>> fetchLostItems(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/lost-items'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => LostItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load lost items');
    }
  }

  Future<void> createLostItem(LostItem lostItem, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/lost-items'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(lostItem.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create lost item');
    }
  }

  Future<void> updateLostItem(LostItem lostItem, String token) async {
    final response = await http.put(
      Uri.parse('$baseUrl/lost-items/${lostItem.id}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(lostItem.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update lost item');
    }
  }

  Future<void> deleteLostItem(int id, String token) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/lost-items/$id'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete lost item');
    }
  }
}
