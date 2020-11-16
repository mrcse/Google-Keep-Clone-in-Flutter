import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesSettings extends StatefulWidget {
  @override
  _NotesSettingsState createState() => _NotesSettingsState();
}

class _NotesSettingsState extends State<NotesSettings> {
  bool addItemsToBottom = true;
  bool checkedItems = false;
  bool linksPreview = false;
  bool enableSharing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Text(
        "Settings",
        style: GoogleFonts.poppins(fontSize: 16),
      )),
      //   title: Row(
      //     children: [
      //       new InkWell(
      //         customBorder: CircleBorder(),
      //         onTap: () {
      //           Get.offAll(NotesHome());
      //         },
      //         child: Padding(
      //           padding: EdgeInsets.all(8),
      //           child: Icon(
      //             Icons.arrow_back,
      //           ),
      //         ),
      //       ),
      //       new SizedBox(
      //         width: 16.0,
      //       ),
      //       new Text(
      //         "Settings",
      //         style: GoogleFonts.poppins(fontSize: 16),
      //       )
      //     ],
      //   ),
      // ),
      body: ListView(
        children: [
          _title("Display Options"),
          _switchTile(
            title: "Add new Items to bottom",
            value: addItemsToBottom,
            onChange: (value) {
              setState(() {
                addItemsToBottom = value;
              });
            },
          ),
          _switchTile(
            title: "Move checked items to button",
            value: checkedItems,
            onChange: (value) {
              setState(() {
                checkedItems = value;
              });
            },
          ),
          _switchTile(
            title: "Display rich link previews",
            value: linksPreview,
            onChange: (value) {
              setState(() {
                linksPreview = value;
              });
            },
          ),
          _listTile("Theme", "System default", () {}),
          _title("Reminder Defaults"),
          _listTile("Morning", "8:00 AM", () {}),
          _listTile("Afternoon", "1:00 PM", () {}),
          _listTile("Evening", "6:00 PM", () {}),
          _title("Sharings"),
          _switchTile(
            title: "Enable sharing",
            value: enableSharing,
            onChange: (value) {
              setState(() {
                enableSharing = value;
              });
            },
          ),
        ],
      ),
    );
  }

  _title(String t) {
    return new Padding(
      padding: EdgeInsets.only(left: 20, top: 30),
      child: new Text(t.toUpperCase(),
          style: GoogleFonts.poppins(
              fontSize: 11, color: Colors.blue, fontWeight: FontWeight.w500)),
    );
  }

  _switchTile({String title, Function onChange, bool value}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SwitchListTile(
          value: value,
          onChanged: onChange,
          title: Text(
            title,
            style: GoogleFonts.poppins(fontSize: 14),
          ),
        ),
        new Divider(),
      ],
    );
  }

  _listTile(String t, String s, Function onTap) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new Text(t, style: GoogleFonts.poppins(fontSize: 14)),
              new Text(
                s,
                style: GoogleFonts.poppins(fontSize: 14),
              )
            ],
          ),
        ),
        new Divider(),
      ],
    );
  }
}
