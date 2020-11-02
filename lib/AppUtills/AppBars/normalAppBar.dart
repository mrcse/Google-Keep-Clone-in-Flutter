import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keep_clone/AppUIs/notesSearch.dart';

class NormalAppBar extends StatelessWidget {
  final Function changeView;
  final Function openDrawer;
  final bool isGrid;
  NormalAppBar({this.changeView, this.openDrawer, this.isGrid});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      sliver: new SliverAppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        floating: true,
        backgroundColor: Colors.transparent,
        flexibleSpace: new Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          margin: EdgeInsets.only(top: 40),
          child: InkWell(
            customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => NotesSearch())),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  new SizedBox(
                    width: 6,
                  ),
                  new InkWell(
                    customBorder: CircleBorder(),
                    onTap: openDrawer,
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
                    onTap: changeView,
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
                      "Avatar Presses ",
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
    );
  }
}