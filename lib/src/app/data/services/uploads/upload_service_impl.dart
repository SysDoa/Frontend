import 'dart:io';

import 'package:file_picker/file_picker.dart';

import 'upload_service.dart';

class UploadServiceImpl implements UploadService {
  @override
  Future<File?> getFileJson() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json']
    );

    if (result != null && result.files.single.path != null) {
      final filePath = result.files.single.path!;
      return File(filePath);
    }
    return null;
  }
}
