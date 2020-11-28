import 'package:flutter/material.dart';

enum MenuOptions{Unarchive,Archive,Delete,MakeCopy,Send,GoogleCopy}

class PopupMenuOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOptions>(
      onSelected: (val){print(val);}
      ,itemBuilder: (_){
        return <PopupMenuEntry<MenuOptions>>[
          _popupMenuItem(child:"Archive",value: MenuOptions.Archive,),
                  ];
                  }
                );
            }
          
            _popupMenuItem({String child, MenuOptions value}) {
              return PopupMenuItem(child: Text(child),value: value,);
            }
}