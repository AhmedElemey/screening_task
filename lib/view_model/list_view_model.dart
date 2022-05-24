import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:screening_task/models/product_model.dart';
import 'package:screening_task/services/list_service.dart';

final getDataFromApi =
    ChangeNotifierProvider<ListViewModel>((ref) => ListViewModel());

class ListViewModel extends ChangeNotifier {
  int counterNumber = 1;

  void increaseCounterNumber(Products product) {
    product.counter = product.counter! + 1;
    notifyListeners();
  }

  void decreaseCounterNumber(Products product) {
    product.counter = product.counter! - 1;
    notifyListeners();
  }

  int get getCounterNumber {
    return counterNumber;
  }

  void addToCart(Products product) {
    cartProductList.add(product);
    notifyListeners();
  }

  void deleteFromCart(Products product) {
    cartProductList.removeWhere(
      (element) => element.id == product.id,
    );
    notifyListeners();
  }

  ListViewModel() {
    getProductData();
  }

  List<Products> productList = [];
  List<Products> cartProductList = [];

  Future<ProductModel?> getProductData() async {
    notifyListeners();
    final results = await ListServices().getData().then((response) {
      productList.clear();
      productList.addAll(response!.products!);
      notifyListeners();
    }).onError((error, stackTrace) {
      print(error.toString());
    });
    notifyListeners();
    return results;
  }
}
