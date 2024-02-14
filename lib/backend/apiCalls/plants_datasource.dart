import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plantshop/core/constants.dart';
import 'package:plantshop/core/core.dart';
import 'package:plantshop/core/error/exception.dart';
import 'package:plantshop/models/plant_model.dart';

class PlantDataSource {
  static Future<List<PlantModel>> getAllPlants({required String bToken}) async {
    try {
      // final mybody = json.encode({'email': email, 'password': password});
      final myheader = headers;
      myheader.addAll({'Authrization': bToken});

      final response = await http.get(
        Uri.parse('${baseUrl}plant/plants'),
        headers: myheader,
      );

      debugPrint(
          ' \n getAllPlants response => ${response.statusCode} ${response.body}');
      if (response.statusCode == 200) {
        final plants = (jsonDecode(response.body)['data'] as List<dynamic>)
            .map((e) => PlantModel.fromJson(e))
            .toList();

        return plants;
      } else if (response.statusCode == 401) {
        throw CustomException('Unautherized');
      } else {
        throw CustomException('fail to get all Plants ');
      }
    } catch (e) {
      debugPrint('eror catched getallplants : $e');
      if (e is UserAuthFailException) {
        rethrow;
      } else if (e is CustomException) {
        rethrow;
      } else {
        throw SomethingWentWrongException(
            'Something Wrong happen while authenticating user');
      }
    }
  }

  // by id
  static Future<PlantModel> getPlantById(
      {required String bToken, required String Id}) async {
    try {
      // final mybody = json.encode({'email': email, 'password': password});
      final myheader = headers;
      myheader.addAll({'Authrization': bToken});

      final response = await http.get(
        Uri.parse('${baseUrl}plant/plants/$Id'),
        headers: myheader,
      );

      debugPrint(
          ' \n getPlantbyID response => ${response.statusCode} ${response.body}');
      if (response.statusCode == 200) {
        final plant = PlantModel.fromJson(jsonDecode(response.body)['data']);

        return plant;
      } else {
        throw CustomException('fail to get  Plant by id');
      }
    } catch (e) {
      debugPrint('eror catched getplant : $e');
      if (e is UserAuthFailException) {
        rethrow;
      } else if (e is CustomException) {
        rethrow;
      } else {
        throw SomethingWentWrongException(
            'Something Wrong happen while authenticating user');
      }
    }
  }
}