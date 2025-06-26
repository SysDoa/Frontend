import 'dart:io';

abstract interface class UploadService {
  Future<File?> getFileJson();
}
