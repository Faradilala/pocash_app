import 'package:flutter/foundation.dart';
import 'package:pocash_app/other/user.dart'; // Import your User model
import 'package:pocash_app/helper/dbHelper.dart'; // Import your DbHelper class

class UserProvider extends ChangeNotifier {
  User? _user;
  final DbHelper dbHelper = DbHelper(); // Create an instance of your DbHelper

  User? get user => _user;

  // Fetch user data by email
  Future<void> fetchUserByEmail(String email) async {
    final user = await dbHelper.getUserByEmail(email);
    if (user != null) { 
      _user = user;
      notifyListeners(); // Notify listeners of the change in user data
    }
  }
}