import 'package:flutter/material.dart';

class MenuControllerIndex extends ChangeNotifier {
  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  onIndexTapped(int index) {
    if (index != currentIndex.value) {
      currentIndex.value = index;
      notifyListeners();
    }
  }
}
