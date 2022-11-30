import 'package:flutter/material.dart';
import 'package:todo_master/constants/colors.dart';

class AddTodo extends StatelessWidget {
  final TextEditingController textController;
  final Function addToDoItem;

  const AddTodo(
      {super.key, required this.textController, required this.addToDoItem});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              margin: const EdgeInsets.only(bottom: 20, right: 10, left: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                    hintText: "Add a new todo item",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 20,
              right: 20,
            ),
            child: ElevatedButton(
              onPressed: () {
                addToDoItem(textController.text);
              },
              style: ElevatedButton.styleFrom(
                primary: tdBlue,
                minimumSize: Size(60, 60),
                elevation: 10,
              ),
              child: const Text(
                "+",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
