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
                        leading: Icon(Icons.radio_button_unchecked_outlined),
                        title: Text(
                          todos[i].content,
                          style: TextStyle(fontSize: 20),
                        ),
                        trailing: Icon(Icons.horizontal_rule_outlined));
                  }),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
          ),
        ));
  }
}
