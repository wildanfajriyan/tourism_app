import 'package:flutter/widgets.dart';
import 'package:tourism_app/model/tourism.dart';

class BookmarkListProvider extends ChangeNotifier {
  final List<Tourism> _bookmarkList = [];

  List<Tourism> get bookmarkList => _bookmarkList;

  void addBookmark(Tourism value) {
    _bookmarkList.add(value);
    notifyListeners();
  }

  void removeBookmark(Tourism value) {
    _bookmarkList.removeWhere((element) => element.id == value.id);
  }

  bool checkItemBookmark(Tourism value) {
    final tourismList =
        _bookmarkList.where((element) => element.id == value.id);
    return tourismList.isNotEmpty;
  }
}
