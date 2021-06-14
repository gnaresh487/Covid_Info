import 'dart:async';
import 'package:covid_latest_info/model/covid_info_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CovidInfoRepo{

  // getting Covid Summery from server
  Future<CovidInfoModel> getCovidSummery() async{
    try{
      final request = http.Request('GET', Uri.parse('https://api.covid19api.com/summary'));

      final http.StreamedResponse response = await request.send().timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final jsonResponse = await response.stream.bytesToString();
        return covidInfoModelFromJson(jsonResponse);
      } else {
        return CovidInfoModel();
        debugPrint('Request failed with status: ${response.statusCode}.');
      }
    } on TimeoutException catch (te) {
      return CovidInfoModel();
    }
  }
}