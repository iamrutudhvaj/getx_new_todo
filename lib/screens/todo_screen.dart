import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_new_todo/controllers/model_controller.dart';
import 'package:getx_new_todo/controllers/todo_controller.dart';
import 'package:getx_new_todo/models/todo.dart';

class TodoScreen extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();
  final ModelController modelController = Get.find<ModelController>();
  final int index;
  TodoScreen({this.index});

  @override
  Widget build(BuildContext context) {
    String text = "";
    if (!this.index.isNull) {
      text = todoController.todos[index].text;
    }
    TextEditingController textEditingController =
        TextEditingController(text: text);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          modelController.increment();
        },
        child: Icon(Icons.add),
        mini: true,
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: "What do you want to accomplish?",
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 999,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      child: Text("Cancel"),
                      color: Colors.red,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (this.index.isNull) {
                          todoController.todos.add(
                            Todo(
                              text: textEditingController.text,
                            ),
                          );
                        } else {
                          var editing = todoController.todos[index];
                          editing.text = textEditingController.text;
                          todoController.todos[index] = editing;
                        }
                        Get.back();
                      },
                      child: Text((this.index.isNull) ? "Add" : "Edit"),
                      color: Colors.green,
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
