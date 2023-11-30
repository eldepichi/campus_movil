import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class InternetChecker {
  Future<bool> hasInternet() async {
    try {
      if (kIsWeb) {
        final response = await http.get(
          Uri.parse('google.com'),
        );
        return response.statusCode == HttpStatus.ok;
      } else {
        final list = await InternetAddress.lookup('google.com');
        return list.isNotEmpty && list.first.rawAddress.isNotEmpty;
      }
    } catch (e) {
      return false;
    }
  }
}
