import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keep_clone/AppUIs/notesAdd.dart';
import 'package:keep_clone/AppUtills/AppBottomBar/bottomAppBar.dart';
import 'package:keep_clone/AppUtills/AppBottomBar/floatingActionButton.dart';
import 'package:keep_clone/AppUtills/AppDrawer/appDrawer.dart';
import 'package:keep_clone/AppUtills/selectiveGridView.dart';

class RemindNotes extends StatefulWidget {
  RemindNotes({Key key}) : super(key: key);

  @override
  _RemindNotesState createState() => _RemindNotesState();
}

class _RemindNotesState extends State<RemindNotes> {
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
    return Scaffold(
      appBar: _selectionMode ? selectionAppbar() : _normalAppBar(),
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
      bottomNavigationBar: BottomBar(),
      floatingActionButton: FloatingButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddNotes())),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }

  _normalAppBar() {
    return new AppBar(
      backgroundColor: Theme.of(context).cardColor,
      title: new Text("Reminders",
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

  selectionAppbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).cardColor,
      title: Row(
        children: [
          iconButton(
              onTap: () {
                setState(() {
                  _selectionMode = false;
                  _selectedIndexList.clear();
                });
              },
              icon: Icons.close),
          new SizedBox(
            width: 6,
          ),
          Expanded(
            child: new Text(
              "${_selectedIndexList.length}",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          iconButton(onTap: () {}, icon: Icons.push_pin_outlined),
          iconButton(onTap: () {}, icon: Icons.add_alert_outlined),
          iconButton(onTap: () {}, icon: Icons.color_lens_outlined),
          iconButton(onTap: () {}, icon: Icons.label_outline),
          iconButton(onTap: () {}, icon: Icons.more_vert),
          new SizedBox(
            width: 6,
          ),
        ],
      ),
    );
  }

  iconButton({Function onTap, IconData icon}) {
    return new InkWell(
      customBorder: CircleBorder(),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon),
      ),
    );
  }
}
