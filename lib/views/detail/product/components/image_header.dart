import 'package:flutter/material.dart';

import '../ProductDetailScreen.dart';

class ImageHeader extends StatelessWidget {
  const ImageHeader({
    Key key,
    @required this.size,
    @required this.widget,
  }) : super(key: key);

  final Size size;
  final ProductDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 250,
      child: Image.network(
        widget.products.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
