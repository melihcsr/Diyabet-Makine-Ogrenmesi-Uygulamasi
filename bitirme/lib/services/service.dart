import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:bitirme/models/result_model.dart';

class Service {
  final String baseUrl = "http://localhost:8000/predict-lgbm";
  Object? objectResponse;

  ResultModel result = ResultModel(outcome: 0, prediction: "");

  Future<ResultModel?> apiCall({
    required int pregnancies,
    required int glucose,
    required int blood_pressure,
    required int skin_thickness,
    required int insulin,
    required double bmi,
    required double diabetes_pedigree_function,
    required int age,
  }) async {
    final data = {
      "pregnancies": pregnancies,
      "glucose": glucose,
      "blood_pressure": blood_pressure,
      "skin_thickness": skin_thickness,
      "insulin": insulin,
      "bmi": bmi,
      "diabetes_pedigree_function": diabetes_pedigree_function,
      "age": age
    };
    String body = jsonEncode(data);
    var header = {
      "content-type": "application/json",
      "server": "uvicorn",
    };
    final response =
        await http.post(Uri.parse(baseUrl), body: body, headers: header);
    if (response.statusCode == 200) {
      result = ResultModel.fromJson(jsonDecode(response.body));
      log(result.toString());
      log("İslem Basarili");
      jsonDecode(objectResponse.toString());
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
