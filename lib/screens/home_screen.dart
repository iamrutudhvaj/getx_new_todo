import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_new_todo/controllers/model_controller.dart';
import 'package:getx_new_todo/controllers/todo_controller.dart';
import 'package:getx_new_todo/screens/todo_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    final ModelController modelController = Get.put(ModelController());

    return Scaffold(
      appBar: AppBar(
        title: Text("GetX todo List"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(TodoScreen());
        },
      ),
      body: SafeArea(
        child: Container(
          child: Obx(
            () => ListView.separated(
              itemBuilder: (context, index) => Dismissible(
                key: UniqueKey(),
                onDismissed: (_) {
                  var removed = todoController.todos[index];
                  todoController.todos.removeAt(index);
                  Get.snackbar('Task removed',
                      'The task "${removed.text}" was successfully removed.',
                      mainButton: FlatButton(
                        child: Text('Undo'),
                        onPressed: () {
                          if (removed.isNull) {
                            return;
                          }
                          todoController.todos.insert(index, removed);
                          removed = null;
                          if (Get.isSnackbarOpen) {
                            Get.back();
                          }
                        },
                      ));
                },
                child: ListTile(
                  title: Text(
                    todoController.todos[index].text +
                        " " +
                        modelController.testModel.value.count.toString(),
                    style: (todoController.todos[index].done)
                        ? TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough)
                        : TextStyle(
                            color: Theme.of(context).textTheme.bodyText1.color,
                          ),
                  ),
                  onTap: () {
                    Get.to(TodoScreen(
                      index: index,
                    ));
                  },
                  leading: Checkbox(
                      value: todoController.todos[index].done,
                      onChanged: (value) {
                        var changed = todoController.todos[index];
                        changed.done = value;
                        todoController.todos[index] = changed;
                      }),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              separatorBuilder: (_, __) => Divider(),
              itemCount: todoController.todos.length,
            ),
          ),
        ),
      ),
    );
  }
}
