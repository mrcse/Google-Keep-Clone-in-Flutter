import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keep_clone/AppUI/normalAppBar.dart';

class NotesHome extends StatefulWidget {
  @override
  _NotesHomeState createState() => _NotesHomeState();
}

class _NotesHomeState extends State<NotesHome> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
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
                  onTap: () => print("Tap Detected...."),
                  child: Row(
                    children: [
                      new SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.menu,
                          ),
                          onPressed: () => _drawerKey.currentState.openDrawer()),
                      new SizedBox(
                        width: 10,
                      ),
                      Expanded(child: new Text("Search your notes")),
                      new IconButton(
                          icon: Icon(Icons.grid_view),
                          onPressed: () => print("GridView")),
                      new SizedBox(
                        width: 5,
                      ),
                      new CircleAvatar(
                        backgroundColor: Colors.amberAccent,
                        radius: 14.5,
                      ),
                      new SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          new SliverGrid.count(
              crossAxisCount: 2,
              children: List.generate(
                20,
                (index) => new Card(),
              ))
        ],
      ),
      drawer: new Drawer(),
    );
  }
}
 