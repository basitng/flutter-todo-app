import 'package:flutter/material.dart';
import 'package:todo_master/constants/colors.dart';
import 'package:todo_master/models/Todo.dart';

// ADD REMINDER TODO
class TodoCard extends StatelessWidget {
  final ToDo todo;
  final handleToDoChange;
  final onDeleteItem;

  const TodoCard(
      {super.key,
      required this.todo,
      required this.handleToDoChange,
      required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: ListTile(
          onTap: () {
            handleToDoChange(todo);
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: Colors.white,
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: tdBlue,
          ),
          title: Text(
            todo.todoText!,
            style: TextStyle(
              color: tdBlack,
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                color: tdRed, borderRadius: BorderRadius.circular(5.0)),
            child: IconButton(
              iconSize: 20,
              color: Colors.white,
              icon: Icon(Icons.delete),
              onPressed: () {
                onDeleteItem(todo.id);
              },
            ),
          ),
        ));
  }
}
