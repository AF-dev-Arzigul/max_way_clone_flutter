import 'package:dio/dio.dart';
import 'package:max_way/models/MaxWayBranches.dart';
import '../models/max_way_model.dart';


class Api {
  final _dio = Dio(BaseOptions(baseUrl: "https://maxway.uz/_next/data/ch7KmKvJ5azfPmlISTmjb"));

  Future<MaxWay> getData() async {
    final response = await _dio.get("/uz.json");
    final res = MaxWay.fromJson(response.data);
    return res;
  }

  Future<MaxWayBranches> getBranches() async {
    final response = await _dio.get("/uz/branches.json");
    final res = MaxWayBranches.fromJson(response.data);
    return res;
  }

}
