import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        elevation: 20.0,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _bottomBarElement(icon: Icons.check_box_outlined, onTap: () {}),
            _bottomBarElement(icon: Icons.brush_outlined, onTap: () {}),
            _bottomBarElement(icon: Icons.mic_none, onTap: () {}),
            _bottomBarElement(
                icon: Icons.photo_outlined,
                onTap: () => _showPhotoOption(context)),
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

  _showPhotoOption(BuildContext context) {
    var alert = new AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: new Text(
        "Add image",
      ),
      titleTextStyle:
          GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w500),
      titlePadding: EdgeInsets.only(left: 20, top: 20),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          new ListTile(
            title: new Text("Take photo"),
            leading: Icon(Icons.camera_alt_outlined),
          ),
          new ListTile(
            title: new Text("Choose image"),
            leading: Icon(Icons.photo_outlined),
          ),
        ],
      ),
      contentPadding: EdgeInsets.only(left: 25.0, top: 0.0, bottom: 0.0),
      contentTextStyle: GoogleFonts.poppins(fontSize: 16.0),
    );

    showDialog(context: context, child: alert);
  }
}
