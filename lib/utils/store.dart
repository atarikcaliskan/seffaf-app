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

  Future<Map<String, dynamic>> getStoreItem(String dataKey) async {
    final storeData = await localStore().collection(dataKey).get();
    return storeData;
  }

  String getId(String dataKey) {
    final id = localStore().collection(dataKey).doc().id;
    return id;
  }

  Future<Map> getCurrentUser() async {
    final store = new Store();
    var currentUser = {};
    await store.get('users').then((value) => {
          if (value != null)
            {
              value.forEach((e) => {
                    if (e['isLoggedIn']) {currentUser = e}
                  })
            }
        });

    return currentUser;
  }

  Future<dynamic> set(String dataKey, dynamic data) async {
    final uniqueId = localStore().collection(dataKey).doc().id;
    final res = localStore()
        .collection(dataKey)
        .doc(uniqueId)
        .set({'id': uniqueId, ...data});
    return res;
  }

  Future<dynamic> delete(String dataKey, String dataId) async {
    final res = localStore().collection(dataKey).doc(dataKey).delete();
    return res;
  }
}
