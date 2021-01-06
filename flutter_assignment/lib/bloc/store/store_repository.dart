import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterassignment/common/api.dart';
import 'package:flutterassignment/model/store_model.dart';

class StoreRepository {
  ///Fetch store data
  ///return List of result data
  Future<List<Result>> fetchStoreData() async {
    var response = await Dio().get(Api.API_URL);
    print(response.data);

    var decodedData = json.decode(response.data);

    var data = StoreModel.fromJson(decodedData);

    return data.result;
  }
}
