

import 'dart:io';

import 'package:flutter/material.dart';
class ImageCard extends StatelessWidget {
  const ImageCard({this.imageFile});

  final File imageFile;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.file(imageFile, fit: BoxFit.cover),
    );
  }
}