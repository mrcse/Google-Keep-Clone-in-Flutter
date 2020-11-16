import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyGridTile extends StatelessWidget {
  final List<dynamic> list;
  final List<dynamic> selectedIndexList;
  final int index;
  final Function onTap;
  final Function onLongPress;
  final bool selectionMode;

  MyGridTile({
    this.list,
    this.selectedIndexList,
    this.index,
    this.onLongPress,
    this.onTap,
    this.selectionMode = false,
  });

  @override
  Widget build(BuildContext context) {
    if (selectionMode) {
      return InkWell(
        onTap: onTap,
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(
                  width: 2.5,
                  color: selectedIndexList.contains(index)
                      ? Colors.white
                      : Colors.transparent)),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "${list[index]['title']}",
              style: GoogleFonts.poppins(
                  fontSize: 18.0, color: Colors.grey.shade400),
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        onLongPress: onLongPress,
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "${list[index]['title']}",
              style: GoogleFonts.poppins(
                  fontSize: 18.0, color: Colors.grey.shade400),
            ),
          ),
        ),
      );
    }
  }
}
