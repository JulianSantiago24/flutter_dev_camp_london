import 'package:flutter/material.dart';
import 'package:flutter_to_do/src/models/flutter_to_do_model.dart';

class ToDoViewModel extends ChangeNotifier {
  final List<ToDoItem> items = List.empty(growable: true);

  void addItem(String title) {
    items.add(ToDoItem(title, false));
    notifyListeners();
  }

 void changeItem(int index, {String? title, bool? isChecked}) {
    if (index >= items.length) return;

    final todoItem = items.removeAt(index);
    final newItem = ToDoItem(
      title ?? todoItem.title,
      isChecked ?? todoItem.isChecked,
    );
    items.insert(index, newItem);
    notifyListeners();
  }

  void removeItemAt(int index) {
    items.removeAt(index);
    notifyListeners();
  }
}
