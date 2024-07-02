import 'package:flutter/material.dart';
import 'package:projectakhir/data/service/lost_item_service.dart';
import 'package:projectakhir/domain/model/lost_item_model.dart';

class LostItemController {
  final LostItemService _service = LostItemService();

  Future<List<LostItem>> getLostItems(String token) async {
    return await _service.fetchLostItems(token);
  }

  Future<void> createLostItem(
      BuildContext context, LostItem lostItem, String token) async {
    await _service.createLostItem(lostItem, token);
    Navigator.of(context).pop();
  }

  Future<void> updateLostItem(
      BuildContext context, LostItem lostItem, String token) async {
    await _service.updateLostItem(lostItem, token);
    Navigator.of(context).pop();
  }

  Future<void> deleteLostItem(int id, String token) async {
    await _service.deleteLostItem(id, token);
  }
}
