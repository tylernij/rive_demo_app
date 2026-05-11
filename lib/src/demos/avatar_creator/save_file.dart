import 'dart:io';
import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';

/// Save an image to the disk.
class SaveFile {
  /// Creates a new [SaveFile].
  SaveFile({required this.pngBytes});

  /// The PNG bytes to save.
  final Uint8List pngBytes;

  /// Save the image.
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
    const fileName = 'avatar.png';
    final result = await getSaveLocation(suggestedName: fileName);

    if (result == null) return false;

    const mimeType = 'image/png';
    final textFile = XFile.fromData(
      pngBytes,
      mimeType: mimeType,
      name: fileName,
    );
    await textFile.saveTo(result.path);

    return true;
  }
}
