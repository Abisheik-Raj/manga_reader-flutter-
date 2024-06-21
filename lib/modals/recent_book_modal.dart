import 'package:flutter/material.dart';

class RecentBookModal extends ChangeNotifier {
  bool _present = false;
  String? _title;
  String? _imageUrl;
  int? _selectedChapter;
  int? _totalChapters;
  List? _recents;

  bool get present => _present;
  String? get title => _title;
  String? get imageUrl => _imageUrl;
  int? get selectedChapter => _selectedChapter;
  int? get totalChapters => _totalChapters;
  List? get recents => _recents;

  void updateRecentBook(String title, String imageUrl, int selectedChapter,
      int totalChapters, bool present) {
    _present = present;
    _title = title;
    _imageUrl = imageUrl;
    _selectedChapter = selectedChapter;
    _totalChapters = totalChapters;

    notifyListeners();
  }

  void updateRecents(List recents) {
    _recents = recents;
    notifyListeners();
  }
}
