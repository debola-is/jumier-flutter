import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileIoServices {
  /// Makes use of [pathprovider] package to obtain path directory where cache files are stored.
  ///
  /// [_getSIze]
  Future<int> getCacheSize() async {
    Directory tempDir = await getTemporaryDirectory();
    int tempDirSize = _getSize(tempDir);
    return tempDirSize;
  }

  int _getSize(FileSystemEntity file) {
    if (file is File) {
      return file.lengthSync();
    } else if (file is Directory) {
      int sum = 0;
      List<FileSystemEntity> children = file.listSync();
      for (FileSystemEntity child in children) {
        sum += _getSize(child);
      }
      return sum;
    }
    return 0;
  }

  Future<void> deleteCacheDir() async {
    final cacheDir = await getTemporaryDirectory();

    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
    log("cache has been cleared and cache size is now ${await getCacheSize()}");
  }

  Future<void> deleteAppDir() async {
    final appDir = await getApplicationSupportDirectory();

    if (appDir.existsSync()) {
      appDir.deleteSync(recursive: true);
    }
  }

  // Map<String, int> dirStatSync(String dirPath) {
  //   int fileNum = 0;
  //   int totalSize = 0;
  //   var dir = Directory(dirPath);
  //   try {
  //     if (dir.existsSync()) {
  //       dir
  //           .listSync(recursive: true, followLinks: false)
  //           .forEach((FileSystemEntity entity) {
  //         if (entity is File) {
  //           fileNum++;
  //           totalSize += entity.lengthSync();
  //         }
  //       });
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }

  //   return {'fileNum': fileNum, 'size': totalSize};
  // }
}
