import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keep_clone/AppUtills/searchCategories.dart';

class NotesSearch extends StatefulWidget {
  @override
  _NotesSearchState createState() => _NotesSearchState();
}

class _NotesSearchState extends State<NotesSearch> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new TextField(
          controller: _searchController,
          style: GoogleFonts.poppins(fontSize: 14),
          decoration: new InputDecoration(
              hintText: "Search your notes",
              border: InputBorder.none,
              hintStyle: GoogleFonts.poppins(fontSize: 14)),
          cursorColor: Color(0xff82b1ff),
          cursorRadius: Radius.circular(10),
          cursorHeight: 20,
          cursorWidth: 1.5,
        ),
        backgroundColor: Theme.of(context).cardColor,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _header("TYPES"),
               InkWell(
                          customBorder: CircleBorder(),
                          onTap: () {},
                          child: _header("More"),
                        ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                SearchCategory(
                  title: "Images",
                  icon: Icons.photo_outlined,
                ),
                SizedBox(
                  width: 4.0,
                ),
                SearchCategory(
                  title: "Reminders",
                  icon: Icons.notifications_none,
                ),
                SizedBox(
                  width: 4.0,
                ),
                SearchCategory(
                  title: "URLs",
                  icon: Icons.link,
                ),
                SizedBox(
                  width: 4.0,
                ),
                SearchCategory(
                  title: "Lists",
                  icon: Icons.check_box_outlined,
                ),
                SizedBox(
                  width: 4.0,
                ),
                SearchCategory(
                  title: "Voice",
                  icon: Icons.mic_none,
                ),
                SizedBox(
                  width: 4.0,
                ),
                SearchCategory(
                  title: "Drawing",
                  icon: Icons.brush_outlined,
                ),
                SizedBox(
                  width: 4.0,
                ),
                SearchCategory(
                  title: "Food",
                  icon: Icons.restaurant,
                ),
                SizedBox(
                  width: 4.0,
                ),
                SearchCategory(
                  title: "Places",
                  icon: Icons.place_outlined,
                ),
                SizedBox(
                  width: 4.0,
                ),
                SearchCategory(
                  title: "Travel",
                  icon: Icons.airplanemode_active,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: _header("COLORS"),
          ),
          Row(children: <Widget>[
            _colorItem(Colors.white),
            _colorItem(Colors.grey),
          ])
        ],
      ),
    );
  }

  Widget _colorItem(Color _color) {
    return InkResponse(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(
          left: 8.0,
          right: 4.0,
        ),
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400]),
          color: _color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  RichText _header(String s) {
    return RichText(
      text: TextSpan(
        text: s,
        style: TextStyle(
            fontSize: 11.0,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
