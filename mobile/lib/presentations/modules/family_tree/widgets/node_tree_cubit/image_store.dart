import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

class AvatarImageStore extends ChangeNotifier {
  final Map<String, ui.Image> _images = {};
  final Map<String, bool> _loadings = {};

  ui.Image? get(String key) => _images[key];

  bool contains(String key) => _images.containsKey(key);

  Future<void> load(String key) async {
    if (_images.containsKey(key)) return;
    await _load(key);
    notifyListeners();
  }

  Future<void> loadAll(List<String> keys) async {
    for (final key in keys) {
      if (_images.containsKey(key)) continue;
      await _load(key);
    }
    notifyListeners();
  }

  Future<void> _load(String key) async {
    try {
      if (_images.containsKey(key) || _loadings[key] == true) return;
      _loadings[key] == true;

      late Uint8List bytes;
      if (key.startsWith('http')) {
        final file = await _downloadAndCache(key);
        bytes = await file.readAsBytes();
      } else {
        final data = await rootBundle.load(key);
        bytes = data.buffer.asUint8List();
      }

      final codec = await ui.instantiateImageCodec(bytes);
      final frame = await codec.getNextFrame();

      _images[key] = frame.image;
      _loadings.remove(key);
    } catch (e) {
      _loadings.remove(key);
    }
  }

  Future<File> _downloadAndCache(String url) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/${url.hashCode}.img');

    if (await file.exists()) return file;

    final res = await http.get(Uri.parse(url));
    await file.writeAsBytes(res.bodyBytes);
    return file;
  }
}
