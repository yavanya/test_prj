import 'package:flutter/material.dart';
import '../constant/styles.dart';

class MyTestButton extends StatelessWidget {
  const MyTestButton({
    Key key,
    @required this.onTap,
    this.title,
  }) : super(key: key);

  final GestureTapCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 140,
        height: 44,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
          color: Color(0xffDB00FF),
        ),
        child: Text(
          title,
          style: ProjectStyle.buttonWhite,
        ),
      ),
    );
  }
}
