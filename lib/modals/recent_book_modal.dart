import 'package:flutter/material.dart';

class RecentBookModal extends ChangeNotifier {
  bool _present = false;
  String? _id;
  String? _title;
  String? _description;
  String? _imageUrl;
  int? _selectedChapter;
  int? _totalChapters;
  List? _recents;

  bool get present => _present;
  String? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get imageUrl => _imageUrl;
  int? get selectedChapter => _selectedChapter;
  int? get totalChapters => _totalChapters;
  List? get recents => _recents;

  Map<String, String>? _bookMap;
  Map<String, String>? get bookMap => _bookMap;

  void updateRecentBook(String id, String title, String description,
      String imageUrl, int selectedChapter, int totalChapters, bool present) {
    _id = id;
    _present = present;
    _title = title;
    _description = description;
    _imageUrl = imageUrl;
    _selectedChapter = selectedChapter;
    _totalChapters = totalChapters;
    toJson();
    notifyListeners();
  }

  void toJson() {
    _bookMap = {
      "id": _id!,
      "title": _title!,
      "contentRating": "",
      "publicDemographic": "",
      "description": _description!,
      "imageUrl": _imageUrl!,
    };
  }

  void updateRecents(List recents) {
    _recents = recents;
    notifyListeners();
  }
}
