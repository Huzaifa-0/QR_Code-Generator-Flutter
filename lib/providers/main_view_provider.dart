import 'package:flutter/material.dart';

import '../view/pages/qr_generator_page.dart';
import '../view/pages/qr_scanner_page.dart';

class MainViewProvider with ChangeNotifier {
  final List<Widget> _tabs = [
    const QRGeneratorPage(),
    const QRScannerPage(),
  ];

  int _currentIndex = 0;

  List<Widget> get tabs => _tabs;
  int get currentIndex => _currentIndex;

  set currentIndex(int currentIndex) {
    _currentIndex = currentIndex;
    notifyListeners();
  }
}
