import 'package:flutter/material.dart';
import 'package:hermes_app/repository/window_repository.dart';

// final authProvider = ChangeNotifierProvider((ref) => AuthBloc()..charge());

class WindowProvider with ChangeNotifier {
  final WindowRepository repository = WindowRepository();
  List<dynamic> _windows = [];
  bool _isLoading = false;

  List<dynamic> get windows => _windows;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => windows.isNotEmpty;

  WindowProvider() {
    getWindows();
  }

  Future getWindows() async {
    _windows = await repository.getProperties();
    _isLoading = false;
    notifyListeners();
  }

  void charge() async {
    _isLoading = true;
    notifyListeners();
    getWindows();
    _isLoading = false;
    notifyListeners();
  }
}
