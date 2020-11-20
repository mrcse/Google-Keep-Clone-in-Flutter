import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keep_clone/AppUIs/notesAdd.dart';

class ImageController {
  File _cameraImage;
  ImagePicker _imagePicker = new ImagePicker();

  List<File> _imageFiles;
  FilePickerResult _filePickerResult;

  openCamera() async {
    PickedFile file = await _imagePicker.getImage(source: ImageSource.camera);
    if (null != file) {
      _cameraImage = File(file.path);
      Get.off(AddNotes(cameraImage: _cameraImage));
    } else {
      Text("Error while opening Camera");
    }
  }

  openFileExplore() async {
    try {
      _filePickerResult =
          await FilePicker.platform.pickFiles(allowMultiple: true);
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (_filePickerResult != null) {
      _imageFiles = _filePickerResult.paths.map((path) => File(path)).toList();
    } else {
      Text("Error while picking Images...");
    }
    Get.off(AddNotes(cameraImage: _cameraImage,galleryImage: _imageFiles));
  }
}
