import 'package:flutter/material.dart';

class MyGridTile extends StatelessWidget {
  final List<String> list;
  final List<int> selectedIndexList;
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
                  width: 3.0,
                  color: selectedIndexList.contains(index)
                      ? Colors.redAccent
                      : Colors.transparent)),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.network(
              list[index],
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
            padding: EdgeInsets.all(8.0),
            child: Image.network(
              list[index],
            ),
          ),
        ),
      );
    }
  }
}
