import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do/src/models/flutter_to_do_model.dart';
import 'package:flutter_to_do/src/viewModel/flutter_to_do_view_model.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

class HomePageToDo extends StatelessWidget {
  const HomePageToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: const Color(0xFF83E286),
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'TO-DO List',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Selector<ToDoViewModel, List<ToDoItem>>(
        shouldRebuild: listEquals,
        selector: (BuildContext context, ToDoViewModel viewModel) {
          return viewModel.items;
        },
        builder: (BuildContext context, todoList, Widget? child) {
          return ListView.builder(
            itemCount: todoList.length + 1,
            itemBuilder: (context, index) {
              if (index < todoList.length) {
                return listItem(
                  context,
                  todoList[index],
                  index,
                );
              
              } else if (index == todoList.length) {
                return const Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.edit_note,
                          color: Colors.green,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('We have reached end'),
                      ),
                    ],
                  ),
                );
              }
              return null;
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF83E286),
        onPressed: () => showTodoDialog(context),
        tooltip: 'Add Task',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

  Widget listItem(BuildContext context, ToDoItem item, int index) {
    final model = context.read<ToDoViewModel>();
    return Dismissible(
      key: Key(item.title),
      onDismissed: (_) {
        model.removeItemAt(index);
      },
      background: Container(
        color: Colors.red,
        child: const Row(
          children: [
            Spacer(),
            Icon(Icons.delete),
          ],
        ),
      ),
      child: ListTile(
        title: Text(
          item.title,
          style: TextStyle(
            fontSize: 16.0,
            decoration: item.isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        leading: Checkbox(
          value: item.isChecked,
          onChanged: (bool? newCheckState) {
            if (newCheckState == null) {
              return;
            } else {
              model.changeItem(index, isChecked: newCheckState);
            }
          },
        ),
        onTap: () => showTodoDialog(context, input: item.title, index: index),
      ),
    );
  }

void showTodoDialog(BuildContext context, {String? input, int index = 0}) {
  final TextEditingController controller = TextEditingController();
  final bool isNewTodo = input == null || input.isEmpty;
  if (!isNewTodo) {
    controller.text = input;
  }
  final ToDoViewModel model = context.read<ToDoViewModel>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(isNewTodo ? 'New TODO' : 'Edit TODO'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: isNewTodo ? 'Enter something to do...' : 'Edit your task...',
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('CANCEL'),
            onPressed: () {
              controller.clear();
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(isNewTodo ? 'ADD' : 'SAVE'),
            onPressed: () {
              final task = controller.text;
              if (task.isNotEmpty) {
                if (isNewTodo) {
                  model.addItem(task);
                } else {
                  model.changeItem(index, title: task);
                }
                controller.clear();
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
