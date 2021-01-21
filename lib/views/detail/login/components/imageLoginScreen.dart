import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageLoginScreen extends StatelessWidget {
  const ImageLoginScreen({
    Key key,
    @required this.size,
    this.image,
  }) : super(key: key);

  final Size size;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.4,
      alignment: Alignment.center,
      child: SvgPicture.asset(
        image,
        height: 180,
        width: 180,
      ),
    );
  }
}
