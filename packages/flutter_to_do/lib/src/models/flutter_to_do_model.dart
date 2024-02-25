import 'package:flutter/widgets.dart';

@immutable
class ToDoItem {
  const ToDoItem(
    this.title, 
    this.isChecked
  );

  final String title;
  final bool isChecked;
}
