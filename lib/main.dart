import 'package:flutter/material.dart';
import 'package:keep_clone/AppUIs/notesHome.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google KeepNotes Clone',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: NotesHome(),
    );
  }
}
