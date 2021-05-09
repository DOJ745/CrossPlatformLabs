import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileMethods {
  Future<String> get _localPath async {
    final directoryDocuments = await getApplicationDocumentsDirectory();
    final directoryCache = await getExternalCacheDirectories();

    return directoryDocuments.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}