import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerElement extends StatelessWidget {
  final Function onTap;
  final String title;
  final Icon icon;
  final Color bgColor;
  final bool isSelected;
  const DrawerElement(
      {Key key,
      @required this.onTap,
      @required this.title,
      @required this.icon,
      this.bgColor = Colors.transparent,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(
          customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0))),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.only(left: 30),
            decoration: BoxDecoration(
                color: isSelected ? bgColor : Colors.transparent,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0))),
            height: 50,
            child: Row(
              children: [
                icon,
                new SizedBox(
                  width: 20,
                ),
                new Text(
                  title,
                  style: GoogleFonts.poppins(fontSize: 14),
                )
              ],
            ),
          )),
    );
  }
}
