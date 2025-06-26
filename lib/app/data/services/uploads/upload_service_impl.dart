import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:sysdoa/src/app/data/services/uploads/upload_service.dart';

class UploadServiceImpl implements UploadService {
  @override
  Future<File?> getFileJson() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final filePath = result.files.single.path!;
      return File(filePath);
    }
    return null;
  }
}
