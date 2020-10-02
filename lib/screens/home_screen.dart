import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_new_todo/controllers/todo_controller.dart';
import 'package:getx_new_todo/screens/todo_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());

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
            () {
              return ListView.separated(
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    todoController.todos[index].text,
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
                separatorBuilder: (_, __) => Divider(),
                itemCount: todoController.todos.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
