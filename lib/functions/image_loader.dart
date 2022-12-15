import 'package:flutter/material.dart';

Image assetsImage({required String imagePath}) {
  return Image.asset(
    imagePath,
    fit: BoxFit.contain,
    repeat: ImageRepeat.noRepeat,
  );
}
