import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCloseButton extends StatelessWidget {
  const MyCloseButton({
    Key key,
    @required this.onTap,
  }) : super(key: key);

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset('assets/images/close.svg'),
    );
  }
}
