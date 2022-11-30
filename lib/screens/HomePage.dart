import 'package:flutter/material.dart';
import 'package:todo_master/constants/colors.dart';
import 'package:todo_master/models/Todo.dart';
import 'package:todo_master/widgets/AddToDo.dart';
import 'package:todo_master/widgets/ListTile.dart';
import 'package:todo_master/widgets/SearchBox.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todoList = ToDo.todoList();
  final _textController = TextEditingController();

  List<ToDo> _foundToDo = [];

  @override
  void initState() {
    _foundToDo = todoList;
    super.initState();
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleToDoDelete(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todoList.add(
        ToDo(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            todoText: toDo),
      );
    });
    _textController.clear();
  }

  void _runFilterTodo(String keyword) {
    List<ToDo> results = [];
    if (keyword.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((item) =>
              item.todoText!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBgColor,
      appBar: AppBar(
        toolbarHeight: 60.0,
        leading: const Icon(Icons.menu, color: tdBlack, size: 30),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/me.jpg"),
            radius: 25,
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          children: [
            SearchBox(runFilterTodo: _runFilterTodo),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 20),
                    child: const Text(
                      "All ToDo's",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  for (ToDo todoo in _foundToDo.reversed)
                    TodoCard(
                      todo: todoo,
                      handleToDoChange: _handleToDoChange,
                      onDeleteItem: _handleToDoDelete,
                    )
                ],
              ),
            ),
            AddTodo(textController: _textController, addToDoItem: _addToDoItem),
          ],
        ),
      ),
    );
  }
}
