import 'package:flutter/material.dart';
import './constants.dart';

void main() {
  runApp(TodoPage());
}

class Todo {
  bool completed = false;
  String content = 'Deliver today\'s talk';
}

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> todos = [Todo(), Todo(), Todo()];

  _changeStatus(int i) =>
      setState(() => todos[i].completed = !todos[i].completed);
  _removeTodo(int i) => setState(() => todos.removeAt(i));
  _newTodo() => setState(() => todos.add(Todo()));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            accentColor: Colors.lightBlue,
            brightness: Brightness.light,
            fontFamily: 'GoogleSans'),
        home: Scaffold(
          appBar: AppBar(
            leading: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Image.asset(kLogoColor)),
            title: Text('Todo'),
            backgroundColor: Colors.white,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode))
            ],
          ),
          body: todos.isEmpty
              ? Center(
                  child: Opacity(
                      opacity: 0.5,
                      child: Image.asset('assets/images/empty.png')),
                )
              : ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  itemCount: todos.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                        leading: IconButton(
                          icon: Icon(todos[i].completed
                              ? Icons.task_alt
                              : Icons.radio_button_unchecked_outlined),
                          onPressed: () => _changeStatus(i),
                        ),
                        title: Text(
                          todos[i].content,
                          style: TextStyle(
                              fontSize: 20,
                              decoration: todos[i].completed
                                  ? TextDecoration.lineThrough
                                  : null),
                        ),
                        trailing: IconButton(
                            icon: Icon(Icons.horizontal_rule_outlined),
                            onPressed: () => _removeTodo(i)));
                  }),
          floatingActionButton:
              FloatingActionButton(child: Icon(Icons.add), onPressed: _newTodo),
        ));
  }
}
