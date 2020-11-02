import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectionAppBar extends StatefulWidget {
  final Function onTap;
  final List selectedIndexList;
  final bool selectionMode;
  SelectionAppBar(
      {this.onTap, this.selectedIndexList, this.selectionMode = false});
  @override
  _SelectionAppBarState createState() => _SelectionAppBarState(onTap: onTap,
      selectedIndexList: selectedIndexList, selectionMode: selectionMode);
}

class _SelectionAppBarState extends State<SelectionAppBar> {
  final Function onTap;
  final List selectedIndexList;
  bool selectionMode;
  _SelectionAppBarState({this.onTap,this.selectedIndexList, this.selectionMode});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).cardColor,
      title: Row(
        children: [
          iconButton(onTap: onTap, icon: Icons.close),
          new SizedBox(
            width: 6,
          ),
          Expanded(
            child: new Text(
              "${selectedIndexList.length}",
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
