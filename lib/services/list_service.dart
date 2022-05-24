import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:screening_task/models/product_model.dart';

class ListServices {
  static const API = "https://dummyjson.com/products";

  Future<ProductModel?> getData() async {
    var request = await http.get(Uri.parse(API));
    var jsonResponse = json.decode(request.body);
    return ProductModel.fromJson(jsonResponse);
  }
}
