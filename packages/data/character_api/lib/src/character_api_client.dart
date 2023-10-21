import 'dart:convert';

import 'package:duckduckgo/duckduckgo.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CharacterApiClient {
  final String url;
  final http.Client _client;

  CharacterApiClient({
    required this.url,
    http.Client? client,
  }) : _client = client ?? http.Client();

  Future<Result?> getCharaters() async {
    try {
      final uri = Uri.tryParse(url);
      if (uri != null) {
        final response = await _client.get(uri);
        if (response.statusCode == 200) {
          final json = jsonDecode(response.body);
          final result = Result.fromJson(json);
          return result;
        }
      }
    } catch (ex) {
      // Log or send to Crashlytics
      debugPrint(ex.toString());
    }
    return null;
  }
}
