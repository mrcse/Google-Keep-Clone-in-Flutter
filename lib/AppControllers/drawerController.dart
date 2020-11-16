import 'package:get/get.dart';

class DrawerControllerLite extends GetxController {
  bool isNotes;
  bool isReminder;
  bool isArchive;
  bool isTrash;
  bool isSettings;
  bool isHelp;

  @override
  void onInit() {
    isNotes = true;
    isReminder = false;
    isArchive = false;
    isTrash = false;
    super.onInit();
  }

  toggleElement(bool n, bool r, bool a, bool t) {
    this.isNotes = n;
    this.isReminder = r;
    this.isArchive = a;
    this.isTrash = t;
    update();
  }
}
