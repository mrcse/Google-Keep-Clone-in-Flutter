import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keep_clone/AppUtills/AppBars/selectionAppBar.dart';
import 'package:keep_clone/AppUtills/AppDrawer/appDrawer.dart';
import 'package:keep_clone/AppUtills/selectiveGridView.dart';

class TrashNotes extends StatefulWidget {
  @override
  _TrashNotesState createState() => _TrashNotesState();
}

class _TrashNotesState extends State<TrashNotes> {
  bool isGrid = true;
  List<dynamic> _dataList = [
    {
      "userId": 1,
      "id": 1,
      "title":
          "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      "body":
          "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    },
    {
      "userId": 1,
      "id": 2,
      "title": "qui est esse",
      "body":
          "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
    },
    {
      "userId": 1,
      "id": 3,
      "title": "ea molestias quasi exercitationem repellat qui ipsa sit aut",
      "body":
          "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut"
    }
  ];
  List<int> _selectedIndexList = List();
  bool _selectionMode = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
      title: new Text("Trash",
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
      actions: [
        new InkWell(
          customBorder: CircleBorder(),
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.more_vert,
            ),
          ),
        ),
      ],
    );
  }
}
