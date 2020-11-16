import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_clone/AppUIs/notesHome.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google KeepNotes Clone',
      darkTheme: ThemeData.dark(),
      home: NotesHome(),
    );
  }
}
