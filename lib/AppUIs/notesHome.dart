import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:keep_clone/AppUIs/notesAdd.dart';
import 'package:keep_clone/AppUtills/AppDrawer/appDrawer.dart';
import 'package:keep_clone/AppUtills/AppBottomBar/bottomAppBar.dart';
import 'package:keep_clone/AppUtills/AppBottomBar/floatingActionButton.dart';
import 'package:keep_clone/AppUtills/AppBars/normalAppBar.dart';
import 'package:keep_clone/AppUtills/AppBars/selectionAppBarHome.dart';
import 'package:keep_clone/AppUtills/selectiveGridView.dart';
import './dummyList.dart' as list;
import 'package:get/get.dart';

class NotesHome extends StatefulWidget {
  @override
  _NotesHomeState createState() => _NotesHomeState();
}

class _NotesHomeState extends State<NotesHome> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  bool isGrid = true;
  List<dynamic> _dataList = list.myList();
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
          _selectionMode
              ? SelectionAppBarHome(
                  onTap: () {
                    setState(() {
                      _selectionMode = false;
                      _selectedIndexList.clear();
                    });
                  },
                  selectedIndexList: _selectedIndexList,
                  selectionMode: _selectionMode,
                )
              : NormalAppBar(
                  openDrawer: () => _drawerKey.currentState.openDrawer(),
                  isGrid: isGrid,
                  changeView: () {
                    setState(() {
                      isGrid = isGrid ? false : true;
                    });
                  },
                ),
          SliverStaggeredGrid.countBuilder(
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
        ],
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: BottomBar(),
      floatingActionButton: FloatingButton(
        onPressed: () => Get.to(AddNotes()),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }
}
