import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keep_clone/AppControllers/labelController.dart';
import 'package:keep_clone/AppUIs/dummyList.dart';

class NotesLabel extends StatefulWidget {
  @override
  _NotesLabelState createState() => _NotesLabelState();
}

class _NotesLabelState extends State<NotesLabel> {
  TextEditingController _labelTextController = new TextEditingController();
  final label = LabelController(isSelected: List.generate(2, (index) => false));
  final listViewTextField = List.generate(2, (index) => FocusNode());
  List _list = myList();
  bool isLabelActive = true;
  bool isListTileActive = false;
  FocusNode topTextField;

  @override
  void initState() {
    super.initState();

    topTextField = FocusNode();
  }

  @override
  void dispose() {
    topTextField.dispose();
    for (var i = 0; i < listViewTextField.length; i++)
      listViewTextField[i].dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print("${label.isSelected}");
              })
        ],
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
              label.reset();
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
                label.reset();
                setState(() {
                  isLabelActive = true;
                  isListTileActive = false;
                });
              },
              autofocus: true,
              focusNode: topTextField,
              controller: _labelTextController,
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
              label.reset();
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
                    color: label.isSelected[index]
                        ? Colors.grey.shade400
                        : Colors.transparent),
              ),
            ),
            child: new Row(
              children: [
                new GestureDetector(
                  onTap: () {
                    bool temp = label.isSelected[index];
                    label.reset();
                    setState(() {
                      isLabelActive = false;
                      if (!temp) {
                        label.isSelected[index] = true;
                        listViewTextField[index].requestFocus();
                      } else {
                        label.isSelected[index] = false;
                        listViewTextField[index].unfocus();
                      }
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      label.isSelected[index]
                          ? Icons.delete
                          : Icons.label_outline,
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
                      label.reset();
                      setState(() {
                        label.isSelected[index] = true;
                        isLabelActive = false;
                      });
                    },
                    autofocus: false,
                    focusNode: listViewTextField[index],
                    controller: _labelTextController,
                    cursorColor: Colors.grey.shade400,
                    decoration: new InputDecoration(
                      hintText: "Tile",
                      hintStyle: GoogleFonts.poppins(fontSize: 14),
                      border: InputBorder.none,
                    ),
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
                new GestureDetector(
                  onTap: () {
                    bool temp = label.isSelected[index];
                    label.reset();
                    setState(() {
                      isLabelActive = false;
                      if (!temp) {
                        label.isSelected[index] = true;
                        listViewTextField[index].requestFocus();
                      } else {
                        label.isSelected[index] = false;
                        listViewTextField[index].unfocus();
                      }
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: label.isSelected[index]
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
