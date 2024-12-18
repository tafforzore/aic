import 'dart:async';
import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class cloudinaryManagement{
  static const String apiKey =
  String.fromEnvironment('537667729453133', defaultValue: '');
  static const String apiSecret =
  String.fromEnvironment('gQxOzRK3xvu8_-vYELISiYXBIPo', defaultValue: '');
  static const String cloudName =
  String.fromEnvironment('drlamjbmr', defaultValue: '');
// const String folder =
// String.fromEnvironment('media', defaultValue: '');
// const String uploadPreset =
// String.fromEnvironment('CLOUDINARY_UPLOAD_PRESET', defaultValue: '');

  final cloudinary = Cloudinary.unsignedConfig(
    cloudName: cloudName,
  );
}


class DataTransmitNotifier {
  final String? path;
  late final ProgressCallback? progressCallback;
  final notifier = ValueNotifier<double>(0);

  DataTransmitNotifier({this.path, ProgressCallback? progressCallback}) {
    this.progressCallback = progressCallback ??
            (count, total) {
          notifier.value = count.toDouble() / total.toDouble();
        };
  }
}