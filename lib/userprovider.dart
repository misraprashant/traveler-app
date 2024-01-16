import 'package:bmdutask/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProvider extends ChangeNotifier {
  List<UsersModel> _users = [];

  List<UsersModel> get users => _users;

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      _users = responseData.map((data) => UsersModel(
       
      )).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
