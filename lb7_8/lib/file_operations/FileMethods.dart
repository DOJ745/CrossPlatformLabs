import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileMethods {

  Future<String> get _localPath async {
    final directoryDocuments = await getApplicationDocumentsDirectory();
    return directoryDocuments.path;
  }
  Future<String> get _cachePath async {
    final directoryCache = await getExternalCacheDirectories();
    return directoryCache.first.path;
  }
  Future<String> get _externalPath async {
    final directoryExternal = await getExternalStorageDirectory();
    return directoryExternal.path;
  }

  Future<String> getDefaultPath() async {
    final directoryDocuments = await getApplicationDocumentsDirectory();
    return directoryDocuments.path;
  }
  Future<String> getCachePath() async {
    final directoryCache = await getExternalCacheDirectories();
    return directoryCache.first.path;
  }
  Future<String> getExternalPath() async {
    final directoryExternal = await getExternalStorageDirectory();
    return directoryExternal.path;
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
    }
    catch (e) { return 1; }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}