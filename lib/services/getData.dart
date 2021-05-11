import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';


class GetData {
   Future<Map> getDataApi() async {
     Response response = await get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2fff597338b34e66a277888815e454a5'));
     if (response.statusCode == 200) {
       return jsonDecode(response.body);
     } else {
       throw Exception('Failed to get data');
     }
  }
}