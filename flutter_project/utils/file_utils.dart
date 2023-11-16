import 'package:path_provider/path_provider.dart';

mixin FileUtils {
  static Future<String> getFilePath(String fileName) async {
    var appDocumentsDirectory = await getApplicationDocumentsDirectory();
    var appDocumentsPath = appDocumentsDirectory.path;
    var filePath = '$appDocumentsPath/$fileName';

    return filePath;
  }
}
