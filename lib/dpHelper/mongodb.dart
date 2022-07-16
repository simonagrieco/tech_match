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

  static void getFiltri(List<String> compList, List<String> typeList, List<String> osList,
      List<String> ramList, List<String> inchList) async {
    List<Object> listComp= compList;
    List<Object> listType= [];


    var len = compList.length;
    var len1 = typeList.length;
    var len2 = osList.length;
    var len3 = ramList.length;
    var len4= inchList.length;

    /*final data1 = await userCollection.find().forEach((v){
      for ( int i = 0; i< len; i++){
        if(v['Company']==(compList[i])){
          listComp.add(v);
        }
      }
      //if(v['Company'].equals(compList[0]))
    }); */

    /*final data1 = await userCollection.find(where.map.forEach((key, value) { })).toList();*/
    // for(int i=0, j=0; i< len && j<len1; i++, j++)
    for(int i=0, j=0, k=0, w=0; i< len && j<len1 && k<len2 && w<len3; i++, j++, k++, w++) {
      final data1 = await userCollection.find(where.match("Company", compList[i])
          .match("TypeName", typeList[j])
          .match("OpSys", osList[k])
          .match("Ram", ramList[w])
      ).toList();
      print(data1);
    }
  }
}
