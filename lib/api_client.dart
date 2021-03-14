import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uandme/unit.dart';

class ApiClient {
  final _httpClient = HttpClient();
  final _url = 'flutter.udacity.com';

  Future<List<Unit>?> getCategoryUnits(String category) async {
    String path = '/$category';
    final jsonResponse = await getJsonResponse(path, null);
    if (jsonResponse == null) {
      return null;
    }
    var units = <Unit>[];
    for (var item in jsonResponse['units']) {
      var unit = Unit.fromJson(item);
      units.add(unit);
    }
    return units;
  }

  Future<double?> convert(String from, String to, double amount) async {
    // final path = '/currency/convert?from=$from&to=$to&amount=$amount';
    final path = '/currency/convert';
    var params = {
      'from' : from,
      'to' : to,
      'amount' : amount.toString(),
    };
    final jsonResponse = await getJsonResponse(path, params);
    if (jsonResponse == null) {
      return null;
    }
    final result = jsonResponse['conversion'].toString();
    return double.parse(result);
  }

  Future<Map<String, dynamic>?> getJsonResponse(String path, Map<String, dynamic>? params) async {
    try {
      final uri = Uri.https(_url, path, params);
      final httpRequest = await _httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();
      if (httpResponse.statusCode != HttpStatus.ok) {
        print("something error");
        return null;
      }
      final responseBody = await httpResponse.transform(utf8.decoder).join();
      final jsonResponse = json.decode(responseBody);
      return jsonResponse;
    } catch (e) {
      print("error:" + e.toString());
      return null;
    }
  }

}