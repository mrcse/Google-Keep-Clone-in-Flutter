import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keep_clone/AppUIs/dummyList.dart';

class NotesLabel extends StatefulWidget {
  @override
  _NotesLabelState createState() => _NotesLabelState();
}

class _NotesLabelState extends State<NotesLabel> {
  TextEditingController _labelController = new TextEditingController();
  List _list = myList();
  bool isLabelActive = true;
  bool isListTileActive = false;
  FocusNode topTextField;
  FocusNode listViewTextField;

  @override
  void initState() {
    super.initState();

    topTextField = FocusNode();
    listViewTextField = FocusNode();
  }

  @override
  void dispose() {
    topTextField.dispose();
    listViewTextField.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Edit labels",
          style: GoogleFonts.poppins(fontSize: 18),
        ),
      ),
      body: new Column(
        children: [
          _topTextField(),
          Expanded(
            child: _listViewTextField(),
          )
        ],
      ),
    );
  }

  _topTextField() {
    return new Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
              color: isLabelActive ? Colors.grey.shade400 : Colors.transparent),
        ),
      ),
      child: new Row(
        children: [
          new GestureDetector(
            onTap: () {
              setState(() {
                isListTileActive = false;
                if (!isLabelActive) {
                  isLabelActive = true;

                  topTextField.requestFocus();
                } else {
                  isLabelActive = false;
                  topTextField.unfocus();
                }
              });
            },
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(
                isLabelActive ? Icons.close : Icons.add,
                color: Colors.grey.shade400,
              ),
            ),
          ),
          SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: TextField(
              onTap: () {
                setState(() {
                  isLabelActive = true;
                  isListTileActive = false;
                });
              },
              autofocus: true,
              focusNode: topTextField,
              controller: _labelController,
              cursorColor: Colors.grey.shade400,
              decoration: new InputDecoration(
                hintText: "Creat new Label",
                hintStyle: GoogleFonts.poppins(fontSize: 14),
                border: InputBorder.none,
              ),
              style: GoogleFonts.poppins(fontSize: 16),
            ),
          ),
          new GestureDetector(
            onTap: () {
              setState(() {
                isLabelActive = isLabelActive ? false : true;
                isListTileActive = false;
                topTextField.unfocus();
              });
            },
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: isLabelActive
                  ? Icon(
                      Icons.check,
                      color: Colors.grey.shade400,
                    )
                  : Icon(
                      Icons.ac_unit,
                      color: Colors.transparent,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  _listViewTextField() {
    return ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return new Container(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                    color: isListTileActive
                        ? Colors.grey.shade400
                        : Colors.transparent),
              ),
            ),
            child: new Row(
              children: [
                new GestureDetector(
                  onTap: () {
                    setState(() {
                      isLabelActive = false;
                      if (!isListTileActive) {
                        isListTileActive = true;
                        listViewTextField.requestFocus();
                      } else {
                        isListTileActive = false;
                        listViewTextField.unfocus();
                      }
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      isListTileActive ? Icons.delete : Icons.label_outline,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: TextField(
                    onTap: () {
                      setState(() {
                        isListTileActive = true;
                        isLabelActive = false;
                      });
                    },
                    autofocus: false,
                    focusNode: listViewTextField,
                    controller: _labelController,
                    cursorColor: Colors.grey.shade400,
                    decoration: new InputDecoration(
                      hintText: "Creat new Label",
                      hintStyle: GoogleFonts.poppins(fontSize: 14),
                      border: InputBorder.none,
                    ),
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
                new GestureDetector(
                  onTap: () {
                    setState(() {
                      isListTileActive = isListTileActive ? false : true;
                      isLabelActive = false;
                      listViewTextField.unfocus();
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: isListTileActive
                        ? Icon(
                            Icons.check,
                            color: Colors.grey.shade400,
                          )
                        : Icon(
                            Icons.edit,
                            color: Colors.grey.shade400,
                          ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
