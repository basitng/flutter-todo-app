import 'package:flutter/material.dart';
import 'package:todo_master/constants/colors.dart';

class SearchBox extends StatelessWidget {
  final runFilterTodo;
  const SearchBox({super.key, required this.runFilterTodo});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: TextField(
          onChanged: (value) => runFilterTodo(value),
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              size: 20,
              color: tdBlack,
            ),
            contentPadding: EdgeInsets.all(0),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            ),
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: TextStyle(color: tdGray),
          ),
        ));
  }
}
