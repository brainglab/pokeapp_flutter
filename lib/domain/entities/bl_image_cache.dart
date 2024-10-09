import 'dart:typed_data';

class BLImageCache {
  final String url;
  final Uint8List? image;

  BLImageCache({
    required this.url,
    this.image,
  });
}
