import 'package:flutter/material.dart';
import './constants.dart';

void main() {
  runApp(TodoPage());
}

class Todo {
  bool completed = false;
  String content = '';
}

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  bool isLight = true;
  List<Todo> todos = [];

  _changeStatus(int i) =>
      setState(() => todos[i].completed = !todos[i].completed);
  _changeTheme() => setState(() => isLight = !isLight);
  _removeTodo(int i) => setState(() => todos.removeAt(i));
  _newTodo() => setState(() => todos.add(Todo()));
  _updateContent(String text, int i) => setState(() => todos[i].content = text);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            accentColor: Colors.lightBlue,
            brightness: isLight ? Brightness.light : Brightness.dark,
            fontFamily: 'GoogleSans'),
        home: Scaffold(
          appBar: AppBar(
            leading: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Image.asset(isLight ? kLogoColor : kLogoWhite)),
            title: Text('Todo'),
            backgroundColor: isLight ? Colors.white : null,
            actions: [
              IconButton(
                  onPressed: _changeTheme,
                  icon: Icon(isLight ? Icons.dark_mode : Icons.light_mode))
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
                        title: TextField(
                          autofocus: true,
                          decoration: null,
                          controller:
                              TextEditingController(text: todos[i].content),
                          maxLines: null,
                          onSubmitted: (text) => _updateContent(text, i),
                          style: TextStyle(
                              fontSize: 20,
                              decoration: todos[i].completed
                                  ? TextDecoration.lineThrough
                                  : null),
                          textInputAction: TextInputAction.done,
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
