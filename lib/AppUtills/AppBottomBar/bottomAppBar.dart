import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        elevation: 20.0,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _bottomBarElement(icon: Icons.check_box_outlined,onTap: (){}),
            _bottomBarElement(icon: Icons.brush_outlined,onTap: (){}),
            _bottomBarElement(icon: Icons.mic_none,onTap: (){}),
            _bottomBarElement(icon: Icons.photo_outlined,onTap: (){}),
          ],
        ),
      ),
    );
  }

  _bottomBarElement({IconData icon, Function onTap}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        customBorder: CircleBorder(),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: Colors.grey.shade400,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
