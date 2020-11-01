import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keep_clone/AppUI/notesSearch.dart';
import 'package:keep_clone/AppUtills/drawerElements.dart';
import 'package:keep_clone/AppUtills/selectiveGridView.dart';
import 'dart:math';

class NotesHome extends StatefulWidget {
  @override
  _NotesHomeState createState() => _NotesHomeState();
}

class _NotesHomeState extends State<NotesHome> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  bool isGrid = true;
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

  List<String> _imageList = List.generate(
      50,
      (index) =>
          "https://picsum.photos/seed/image0$index/200/${2 + Random().nextInt(5)}00");
  List<int> _selectedIndexList = List();
  bool _selectionMode = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent // status bar color
        ));
    return new Scaffold(
      key: _drawerKey,
      body: new CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            sliver: new SliverAppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              floating: true,
              backgroundColor: Colors.transparent,
              flexibleSpace: new Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                margin: EdgeInsets.only(top: 40),
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => NotesSearch())),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        new SizedBox(
                          width: 6,
                        ),
                        new InkWell(
                          customBorder: CircleBorder(),
                          onTap: () => _drawerKey.currentState.openDrawer(),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.menu,
                            ),
                          ),
                        ),
                        new SizedBox(
                          width: 6,
                        ),
                        Expanded(
                            child: new Text(
                          "Search your notes",
                          style: GoogleFonts.poppins(fontSize: 14),
                        )),
                        new InkWell(
                          customBorder: CircleBorder(),
                          onTap: () {
                            setState(() {
                              isGrid = isGrid ? false : true;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(isGrid
                                ? Icons.grid_view
                                : Icons.view_agenda_outlined),
                          ),
                        ),
                        InkWell(
                          customBorder: CircleBorder(),
                          onTap: () => print(
                            "Avatar Presses",
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: new CircleAvatar(
                              backgroundColor: Colors.amberAccent,
                              radius: 14.5,
                            ),
                          ),
                        ),
                        new SizedBox(
                          width: 6,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          new SliverStaggeredGrid.countBuilder(
            crossAxisCount: 2,
            itemCount: _imageList.length,
            itemBuilder: (context, index) => MyGridTile(
              list: _imageList,
              selectedIndexList: _selectedIndexList,
              selectionMode: _selectionMode,
              onTap: () {
                setState(() {
                  if (_selectedIndexList.contains(index)) {
                    _selectedIndexList.remove(index);
                    if (_selectedIndexList.isEmpty) {
                      _selectionMode = false;
                    }
                  } else {
                    _selectedIndexList.add(index);
                  }
                  debugPrint("List: $_selectedIndexList");
                });
              },
              onLongPress: () {
                setState(() {
                  _selectionMode = true;
                  _selectedIndexList.add(index);
                });
              },
              index: index,
            ),
            staggeredTileBuilder: (index) => StaggeredTile.fit(isGrid ? 1 : 2),
          ),
        ],
      ),
      drawer: new Drawer(
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
              onTap: () =>
                  toggleElement(true, false, false, false, false, false),
              title: "Notes",
              icon: Icon(Icons.lightbulb_outline),
              bgColor: Color(0xff554C33),
              isSelected: isNotes,
            ),
            new DrawerElement(
              onTap: () =>
                  toggleElement(false, true, false, false, false, false),
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
              onTap: () =>
                  toggleElement(false, false, true, false, false, false),
              title: "Archive",
              icon: Icon(Icons.archive_outlined),
              bgColor: Color(0xff554C33),
              isSelected: isArchive,
            ),
            new DrawerElement(
              onTap: () =>
                  toggleElement(false, false, false, true, false, false),
              title: "Trash",
              icon: Icon(Icons.delete),
              bgColor: Color(0xff554C33),
              isSelected: isTrash,
            ),
            new Divider(),
            new DrawerElement(
              onTap: () =>
                  toggleElement(false, false, false, false, true, false),
              title: "Settings",
              icon: Icon(Icons.settings_outlined),
              bgColor: Color(0xff554C33),
              isSelected: isSettings,
            ),
            new DrawerElement(
              onTap: () =>
                  toggleElement(false, false, false, false, false, true),
              title: "Help & feedback",
              icon: Icon(Icons.help_outline),
              bgColor: Color(0xff554C33),
              isSelected: isHelp,
            ),
          ],
        ),
      ),
    );
  }

  body(int index) {
    if (_selectionMode) {
      return InkWell(
        onTap: () {
          setState(() {
            if (_selectedIndexList.contains(index)) {
              _selectedIndexList.remove(index);
              if (_selectedIndexList.isEmpty) {
                _selectionMode = false;
              }
            } else {
              _selectedIndexList.add(index);
            }
          });
        },
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(
                  color: _selectedIndexList.contains(index)
                      ? Colors.red
                      : Theme.of(context).cardColor)),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Image.network(
              _imageList[index],
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        onLongPress: () {
          setState(() {
            _selectionMode = true;
            _selectedIndexList.add(index);
          });
        },
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Card(
          child: Image.network(
            _imageList[index],
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
