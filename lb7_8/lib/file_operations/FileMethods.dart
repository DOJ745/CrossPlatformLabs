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
  Future<File> get _cacheFile async {
    final path = await _cachePath;
    return File('$path/counter_cache.txt');
  }

  Future<File> get _externalFile async {
    final path = await _externalPath;
    return File('$path/counter_external.txt');
  }

  Future<String> readDefCounter() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents + file.path;
    }
    catch (e) { return e.toString(); }
  }
  Future<File> writeDefCounter(String counter) async {
    final file = await _localFile;
    return file.writeAsString('$counter');
  }

  Future<String> readCacheCounter() async {
    try {
      final file = await _cacheFile;
      String contents = await file.readAsString();
      return contents + file.path;
    }
    on FileSystemException catch (e) {

      print(e.toString() + "\nDirectory has been changed to local");
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents + file.path;
    }
  }
  Future<File> writeCacheCounter(String counter) async {
    final file = await _cacheFile;
    return file.writeAsString('$counter');
  }

  Future<String> readExternalCounter() async {
    try {
      final file = await _externalFile;
      String contents = await file.readAsString();
      return contents + file.path;
    }
    on FileSystemException catch (e) {

      print(e.toString() + "\nDirectory has been changed to local");
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents + file.path;
    }
  }
  Future<File> writeExternalCounter(String counter) async {
    final file = await _externalFile;
    return file.writeAsString('$counter');
  }

}