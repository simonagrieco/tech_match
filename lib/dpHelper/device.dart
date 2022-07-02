import 'package:flutter/services.dart';
import 'package:tech_match/dpHelper/mongodb.dart';

class Device {
  static final List<String> devices = [];

  /* static Future<List<String>> getDevices() async {
    List<Map<String, dynamic>> json = await MongoDatabase.getData();
    for (var element in json) {
      devices.add(element["Product"]);
    }
    return devices;
  } */

  static Future<List<String>> getDevices(String query) async {
    List<Map<String, dynamic>> json = await MongoDatabase.getData();
    for (var element in json) {
      devices.add(element["Product"]);
    }
    return List.of(devices).where((device) {
      final String deviceLower = device.toLowerCase();
      final queryLower = query.toLowerCase();

      return deviceLower.contains(queryLower);
    }).toList();
  }

  static List<String> getSuggestions(String query) =>
      List.of(devices).where((device) {
        final String deviceLower = device.toLowerCase();
        final queryLower = query.toLowerCase();

        return deviceLower.contains(queryLower);
      }).toList();
}
