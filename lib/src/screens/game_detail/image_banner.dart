import 'dart:ui';

import 'package:flutter/cupertino.dart';


class ImageBanner extends StatelessWidget {
  final String _imagePath;

  ImageBanner(this._imagePath);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(
          _imagePath,
          width: 150.0,
          fit: BoxFit.fitWidth,
          loadingBuilder: (context, child, loadingProgress) {
            return loadingProgress == null
                ? child
                : Container(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Image.asset('assets/images/cover.png')
                      ]));
          },
        ));
  }
}
