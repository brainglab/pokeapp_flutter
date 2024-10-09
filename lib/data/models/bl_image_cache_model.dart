import 'package:pokeapp_flutter/domain/entities/bl_image_cache.dart';

class BLImageCacheModel extends BLImageCache {
  BLImageCacheModel({
    required super.url,
    super.image,
  });

  factory BLImageCacheModel.fromMap(Map<String, dynamic> json) {
    return BLImageCacheModel(
      url: json['url'],
      image: json['image'],
    );
  }
}
