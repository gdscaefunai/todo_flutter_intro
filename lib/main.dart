import 'package:flutter/material.dart';
import './constants.dart';

void main() {
  runApp(TodoPage());
}

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
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
          body: Center(
            child: Opacity(
                opacity: 0.5, child: Image.asset('assets/images/empty.png')),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
          ),
        ));
  }
}
