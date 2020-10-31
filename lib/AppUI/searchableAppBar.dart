import 'package:flutter/material.dart';

class SearchableAppBar extends StatefulWidget {
  @override
  _SearchableAppBarState createState() => _SearchableAppBarState();
}

class _SearchableAppBarState extends State<SearchableAppBar> {
  TextEditingController _searchNotes = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.menu,
                ),
                onPressed: () => print("MenuButton...")),
            new TextField(
              controller: _searchNotes,
            ),
          ],
        ),
      ),
    );
  }
}
