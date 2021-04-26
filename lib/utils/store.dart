import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';

Localstore localStore() {
  WidgetsFlutterBinding.ensureInitialized();
  final localStoreInstance = Localstore.instance;
  return localStoreInstance;
}

class Store {
  Future<List<dynamic>> get(String dataKey) async {
    var data = [];
    final storeData = await localStore().collection(dataKey).get();
    storeData.forEach((key, value) {
      data.add(value);
    });
    return data;
  }

  Future<dynamic> set(String dataKey, dynamic data) async {
    final uniqueId = localStore().collection(dataKey).doc().id;
    final res = localStore().collection(dataKey).doc(uniqueId).set(data);
    return res;
  }
}
