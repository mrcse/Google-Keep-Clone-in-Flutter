import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keep_clone/AppControllers/drawerController.dart';
import 'package:keep_clone/AppUIs/noteArchive.dart';
import 'package:keep_clone/AppUIs/noteLabel.dart';
import 'package:keep_clone/AppUIs/noteReminder.dart';
import 'package:keep_clone/AppUIs/noteSettings.dart';
import 'package:keep_clone/AppUIs/noteTrash.dart';
import 'package:keep_clone/AppUIs/notesHome.dart';
import 'package:keep_clone/AppUtills/AppDrawer/drawerElements.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final drawerController = Get.put(DrawerControllerLite());

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
            onTap: () {
              drawerController.toggleElement(true, false, false, false);
              Get.offAll(NotesHome());
            },
            title: "Notes",
            icon: Icon(Icons.lightbulb_outline),
            bgColor: Color(0xff554C33),
            isSelected: drawerController.isNotes,
          ),
          new DrawerElement(
            onTap: () {
              drawerController.toggleElement(false, true, false, false);
              Get.offAll(RemindNotes());
            },
            title: "Reminders",
            icon: Icon(Icons.notifications_none_outlined),
            bgColor: Color(0xff554C33),
            isSelected: drawerController.isReminder,
          ),
          new Divider(),
          new DrawerElement(
              onTap: () {
                Get.to(NotesLabel());
              },
              title: "Create new label",
              icon: Icon(Icons.add)),
          new Divider(),
          new DrawerElement(
            onTap: () {
              drawerController.toggleElement(false, false, true, false);
              Get.offAll(ArchiveNotes());
            },
            title: "Archive",
            icon: Icon(Icons.archive_outlined),
            bgColor: Color(0xff554C33),
            isSelected: drawerController.isArchive,
          ),
          new DrawerElement(
            onTap: () {
              drawerController.toggleElement(false, false, false, true);
              Get.offAll(TrashNotes());
            },
            title: "Trash",
            icon: Icon(Icons.delete),
            bgColor: Color(0xff554C33),
            isSelected: drawerController.isTrash,
          ),
          new Divider(),
          new DrawerElement(
            onTap: () {
              print("Settings");
              Get.to(NotesSettings());
            },
            title: "Settings",
            icon: Icon(Icons.settings_outlined),
            bgColor: Color(0xff554C33),
          ),
          new DrawerElement(
            onTap: () => print("Help & feedback"),
            title: "Help & feedback",
            icon: Icon(Icons.help_outline),
            bgColor: Color(0xff554C33),
          ),
        ],
      ),
    );
  }
}
