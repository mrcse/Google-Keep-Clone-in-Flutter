import 'package:flutter/material.dart';

class NormalAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _NormalAppBarState createState() => _NormalAppBarState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _NormalAppBarState extends State<NormalAppBar> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade300,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            
          ],
        ),
      ),
    );
  }
}
