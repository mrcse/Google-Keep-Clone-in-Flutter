import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keep_clone/AppUI/notesSearch.dart';
import 'package:keep_clone/AppUtills/appDrawer.dart';
import 'package:keep_clone/AppUtills/bottomAppBar.dart';
import 'package:keep_clone/AppUtills/floatingActionButton.dart';
import 'package:keep_clone/AppUtills/selectiveGridView.dart';
import 'dart:math';

class NotesHome extends StatefulWidget {
  @override
  _NotesHomeState createState() => _NotesHomeState();
}

class _NotesHomeState extends State<NotesHome> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  bool isGrid = true;

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
                              backgroundColor: Colors.teal,
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
      drawer: AppDrawer(),
      bottomNavigationBar: BottomBar(),
      floatingActionButton: FloatingButton(
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }
}
