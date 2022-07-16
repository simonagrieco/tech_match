import 'dart:developer';

import 'package:tech_match/dpHelper/MongoDBModel.dart';

import 'costant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<String> insert(MongoDbModel data) async {
    try {
      var result = userCollection.insert(data.toJson());

      if (result.isSuccess) {
        return "Data insert success";
      } else {
        return "Data insert gone wrong!";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final data = await userCollection.find().toList();
    return data;
  }

  static Future<List<Map<String, dynamic>>> getDataByName(
      String device1) async {
    final data1 =
        await userCollection.find(where.eq("Product", device1)).toList();
    return data1;
  }
}
