import 'dart:developer';
import 'dart:ffi';

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
      //print(e.toString());
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

  static Future<bool> checkName(String name) async {
    List<Map<String, dynamic>> product = await getDataByName(name);
    if (product.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static void delete(String device) async {
    await userCollection.remove(where.eq("Product", device));
  }

  static Future<List<MongoDbModel>> getFiltri(
      List<String> compList,
      List<String> typeList,
      List<String> osList,
      List<String> ramList,
      List<String> inchList,
      List<String> gpuList,
      List<String> cpuList,
      List<String> memList,
      double price) async {
    var lenGpuList = gpuList.length;
    var lenCpuList = cpuList.length;

    List<MongoDbModel> dbModel = [];

    await userCollection.find({
      "Company": {r'$in': compList},
      "TypeName": {r'$in': typeList},
      "Inches": {r'$in': inchList},
      "OpSys": {r'$in': osList},
      "Memory": {r'$in': memList},
      "Ram": {r'$in': ramList},
    }).forEach((v) {
      //GPU Filter
      for (int i = 0; i < lenGpuList; i++) {
        RegExp gpu = RegExp("[^${gpuList[i]}]+");
        if (gpu.hasMatch(v['Gpu'])) {
          //CPU filter
          for (int i = 0; i < lenCpuList; i++) {
            RegExp cpu = RegExp("[^${cpuList[i]}]+");
            if (cpu.hasMatch(v['Cpu'])) {
              //price filter
              if (double.parse(v['Price_euros']) <= price) {
                print(v);
                MongoDbModel laptop = MongoDbModel(
                    company: v['Company'],
                    product: v['Product'],
                    typeName: v['TypeName'],
                    inches: double.parse(v['Inches']),
                    screenResolution: v['ScreenResolution'],
                    cpu: v['Cpu'],
                    ram: v['Ram'],
                    memory: v['Memory'],
                    gpu: v['Gpu'],
                    opSys: v['OpSys'],
                    price: double.parse(v['Price_euros']));
                dbModel.add(laptop);
              }
            }
          }
        }
      }
    });
    var newList = dbModel.toSet().toList();
    return newList;
  }
}
