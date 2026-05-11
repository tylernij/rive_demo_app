import 'dart:io';
import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';

class SaveFile {
  final Uint8List pngBytes;

  SaveFile({required this.pngBytes});

  Future<bool> save() async {
    if (Platform.isAndroid || Platform.isIOS) {
      return _saveFileMobile();
    } else if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      return _saveFilePc();
    }

    return false;
  }

  Future<bool> _saveFileMobile() async {
    final result = await ImageGallerySaverPlus.saveImage(pngBytes);
    return result != null;
  }

  Future<bool> _saveFilePc() async {
    const String fileName = 'avatar.png';
    final FileSaveLocation? result = await getSaveLocation(
      suggestedName: fileName,
    );

    if (result == null) return false;

    const String mimeType = 'image/png';
    final XFile textFile = XFile.fromData(
      pngBytes,
      mimeType: mimeType,
      name: fileName,
    );
    await textFile.saveTo(result.path);

    return true;
  }
}
