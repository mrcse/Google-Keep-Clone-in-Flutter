import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keep_clone/AppUtills/imageCard.dart';

class AddNotes extends StatelessWidget {
  final cameraImage;
  final List galleryImage;
  final TextEditingController _titleController = new TextEditingController();
  final TextEditingController _noteController = new TextEditingController();
  final ScrollController _controller = ScrollController();
  AddNotes({this.cameraImage, this.galleryImage});
  @override
  Widget build(BuildContext context) {
    debugPrint("\nFck$galleryImage \n ");
    return Scaffold(
        appBar: AppBar(
          actions: [
            iconButton(onTap: () {}, icon: Icons.push_pin_outlined),
            SizedBox(
              width: 8.0,
            ),
            iconButton(onTap: () {}, icon: Icons.add_alert_outlined),
            SizedBox(
              width: 8.0,
            ),
            iconButton(onTap: () {}, icon: Icons.archive_outlined),
            SizedBox(
              width: 8.0,
            ),
          ],
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: ListView(
          children: [
            (null != galleryImage )
                ? StaggeredGridView.countBuilder(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    itemCount: galleryImage.length,
                    itemBuilder: (context, index) => ImageCard(
                      imageFile: galleryImage[index],
                    ),
                    staggeredTileBuilder: (index) {
                      int count = (galleryImage.length % 3 == 0
                          ? 1
                          : (index % 3 == 0)
                              ? 2
                              : 1);
                      return StaggeredTile.count(count, count);
                    },
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  )
                : (null == galleryImage && null != cameraImage)
                    ? ImageCard(
                        imageFile: cameraImage,
                      )
                    : Container(),
            textFeild(controller: _titleController, size: 24.0, hint: "Title"),
            textFeild(
              controller: _noteController,
              size: 16.0,
              hint: "Note",
            ),
          ],
        ),
        bottomNavigationBar: Transform.translate(
          offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 4.0,
            elevation: 20.0,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _bottomBarElement(icon: Icons.add_box_outlined, onTap: () {}),
                _bottomBarElement(icon: Icons.undo, onTap: () {}),
                //_bottomBarElement(icon: Icons.undo,onTap: (){}),
                _bottomBarElement(
                  icon: Icons.more_vert,
                  onTap: () {},
                )
              ],
            ),
          ),
        ));
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

  textFeild({
    TextEditingController controller,
    double size,
    String hint,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: TextField(
          onTap: () {
            Timer(Duration(milliseconds: 150),
                () => _controller.jumpTo(_controller.position.maxScrollExtent));
          },
          controller: controller,
          //expands: true,
          style:
              GoogleFonts.poppins(fontSize: size, color: Colors.grey.shade400),
          cursorColor: Colors.grey.shade400,
          cursorWidth: 1.5,
          maxLines: null,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: GoogleFonts.poppins(
                  fontSize: size, color: Colors.grey.shade400),
              hintText: hint)),
    );
  }

  _bottomBarElement({IconData icon, Function onTap}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        customBorder: CircleBorder(),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: Colors.grey.shade400,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
