import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:week04/pages/food.dart';
import 'package:http/http.dart' as http;

class Shop extends ChangeNotifier {
  Shop() {
    // fetchMenu();
    initializeMenu();
  }
  List<Food> _foodMenu = [];
  List<Food> _cart = [];
  double summaryPrice = 0.0;

  Future<void> initializeMenu() async {
    try {
      _foodMenu = await fetchMenu();
      notifyListeners();
    } catch (e) {
      print('Error initializing menu: $e');
    }
  }

  Future<List<Food>> fetchMenu() async {
    try {
      final response = await http.get(Uri.parse(
          'https://us-central1-flutter-class-buu.cloudfunctions.net/menu?type=pet'));
      List<dynamic> menuJson = json.decode(response.body);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('API Response: $responseData');
        List<Food> menuList = menuJson.map((json) {
          String id = json["id"].toString();
          String imagePath = "lib/images/$id.png";
          return Food.fromJson(json, imagePath);
        }).toList();
        return menuList;
      } else {
        throw Exception(
            'Failed to load menu. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching menu: $e');
    }
  }

  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addToCart(Food foodItem, int quantity) {
    for (int loop = 0; loop < quantity; loop++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }

  double calculateTotalPrice() {
    double total = 0;
    for (var foodItem in _cart) {
      total += double.parse(foodItem.price);
    }
    summaryPrice = total;
    return summaryPrice;
  }
}
