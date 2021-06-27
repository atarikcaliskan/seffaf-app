import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/system.log');
}

Future<File> writeLog(String log) async {
  final file = await _localFile;

  return file.writeAsString(log);
}
