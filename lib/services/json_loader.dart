import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:varanasi_guide/models/ghat_model.dart';
import 'package:varanasi_guide/models/guide_category.dart';

class GhatJsonLoader {
  static Future<List<Ghat>> loadGhats() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/ghats.json',
    );
    final Map<String, dynamic> jsonResponse = json.decode(jsonString);
    final List<dynamic> ghatList = jsonResponse['ghats'];
    return ghatList.map((json) => Ghat.fromJson(json)).toList();
  }
}

class GuideCategoryJsonLoader {
  static Future<List<GuideCategory>> loadCategories() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/guideCategory.json',
    );
    final List<dynamic> jsonResponse = json.decode(jsonString);

    return jsonResponse.map((json) => GuideCategory.fromJson(json)).toList();
  }
}
