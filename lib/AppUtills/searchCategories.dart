import 'package:flutter/material.dart';

class SearchCategory extends StatelessWidget {
  final String title;
  final IconData icon;
  SearchCategory({this.title, this.icon});

  // Widget _typeItem(
  //     {String title, IconData icon, Color bgColor, Color fontColor}) {
  //   return
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: 110.0,
      padding: EdgeInsets.all(4.0),
      color: Color(0xff82b1ff),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: Theme.of(context).scaffoldBackgroundColor,
              size: 35.0,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RichText(
              text: TextSpan(
                text: title,
                style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 11.0),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
