import 'package:flutter/material.dart';
import 'package:hermes_app/User/model/user.dart';

// final authProvider = ChangeNotifierProvider((ref) => AuthBloc()..charge());

class AuthProvider with ChangeNotifier {
  User? _user;
  bool _isLoading = false;

  dynamic get user => _user;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _user != null;

  void charge() async {
    print('charge');
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    _isLoading = false;
    notifyListeners();
  }

  void getUser() async {
    _isLoading = true;
    notifyListeners();
    _user = await Future.delayed(
        const Duration(seconds: 3),
        () => User(
            name: 'Juan',
            uid: '131dasda13213',
            email: 'juan@tes.com',
            photoURL: ''));
    _isLoading = false;
    notifyListeners();
  }
}
