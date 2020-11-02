import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keep_clone/AppUtills/AppDrawer/drawerElements.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool isNotes = true;
  bool isReminder = false;
  bool isArchive = false;
  bool isTrash = false;
  bool isSettings = false;
  bool isHelp = false;

  toggleElement(bool n, bool r, bool a, bool t, bool s, bool h) {
    setState(() {
      this.isNotes = n;
      this.isReminder = r;
      this.isArchive = a;
      this.isTrash = t;
      this.isSettings = s;
      this.isHelp = h;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 16, bottom: 25.0),
            child: new Text(
              "Google Keep Clone",
              style: GoogleFonts.poppins(
                fontSize: 24,
              ),
            ),
          ),
          new DrawerElement(
            onTap: () => toggleElement(true, false, false, false, false, false),
            title: "Notes",
            icon: Icon(Icons.lightbulb_outline),
            bgColor: Color(0xff554C33),
            isSelected: isNotes,
          ),
          new DrawerElement(
            onTap: () => toggleElement(false, true, false, false, false, false),
            title: "Reminders",
            icon: Icon(Icons.notifications_none_outlined),
            bgColor: Color(0xff554C33),
            isSelected: isReminder,
          ),
          new Divider(),
          new DrawerElement(
              onTap: () {}, title: "Create new label", icon: Icon(Icons.add)),
          new Divider(),
          new DrawerElement(
            onTap: () => toggleElement(false, false, true, false, false, false),
            title: "Archive",
            icon: Icon(Icons.archive_outlined),
            bgColor: Color(0xff554C33),
            isSelected: isArchive,
          ),
          new DrawerElement(
            onTap: () => toggleElement(false, false, false, true, false, false),
            title: "Trash",
            icon: Icon(Icons.delete),
            bgColor: Color(0xff554C33),
            isSelected: isTrash,
          ),
          new Divider(),
          new DrawerElement(
            onTap: () => toggleElement(false, false, false, false, true, false),
            title: "Settings",
            icon: Icon(Icons.settings_outlined),
            bgColor: Color(0xff554C33),
            isSelected: isSettings,
          ),
          new DrawerElement(
            onTap: () => toggleElement(false, false, false, false, false, true),
            title: "Help & feedback",
            icon: Icon(Icons.help_outline),
            bgColor: Color(0xff554C33),
            isSelected: isHelp,
          ),
        ],
      ),
    );
  }
}
