import 'package:get/get.dart';

class LabelController extends GetxController {
  List isSelected = List().obs();
  
  LabelController({this.isSelected});
  void reset() {
    for (var i = 0; i < isSelected.length; i++) {
      isSelected[i] = false;
    }
    update();
  }
}
