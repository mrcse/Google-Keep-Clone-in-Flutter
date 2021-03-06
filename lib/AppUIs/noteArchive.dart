import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keep_clone/AppUIs/dummyList.dart';
import 'package:keep_clone/AppUtills/AppBars/selectionAppBar.dart';
import 'package:keep_clone/AppUtills/AppDrawer/appDrawer.dart';
import 'package:keep_clone/AppUtills/selectiveGridView.dart';

class ArchiveNotes extends StatefulWidget {
  ArchiveNotes({Key key}) : super(key: key);

  @override
  _ArchiveNotesState createState() => _ArchiveNotesState();
}

class _ArchiveNotesState extends State<ArchiveNotes> {
  bool isGrid = true;

  List<dynamic> _dataList = myList();
  List<int> _selectedIndexList = List();
  bool _selectionMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectionMode
          ? SelectionAppBar(
              onTap: () {
                setState(() {
                  _selectionMode = false;
                  _selectedIndexList.clear();
                });
              },
              selectedIndexList: _selectedIndexList,
              selectionMode: _selectionMode,
            )
          : _normalAppBar(),
      drawer: new AppDrawer(),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: _dataList.length,
        itemBuilder: (context, index) => MyGridTile(
          list: _dataList,
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
    );
  }

  _normalAppBar() {
    return new AppBar(
      title: new Text("Archive",
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
      actions: [
        new InkWell(
          customBorder: CircleBorder(),
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.search,
            ),
          ),
        ),
        new InkWell(
          customBorder: CircleBorder(),
          onTap: () {
            setState(() {
              isGrid = isGrid ? false : true;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(isGrid ? Icons.grid_view : Icons.view_agenda_outlined),
          ),
        ),
      ],
    );
  }
}
