import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../constant/colors.dart';
import '../constant/styles.dart';
import '../widgets/close_button_widget.dart';
import '../widgets/test_button_widget.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key key}) : super(key: key);

  static const routeName = '/screen_1';

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffB9B9B9),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: ProjectColor.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    _TitleBar(),
                    _Subtitle(),
                    _ScrollableArea(),
                    _TestButton()
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class _TestButton extends StatelessWidget {
  const _TestButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Padding(
      padding: EdgeInsets.all(16.0),
      child: MyTestButton(
        onTap: null,
        title: 'TEST BUTTON',
      ),
    ));
  }
}

class _ScrollableArea extends StatelessWidget {
  const _ScrollableArea({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Container(height: _height*0.5,
      constraints: const BoxConstraints(
        maxHeight: 400,
      ),
      child: Container(
        color: const Color(0xffDFDEDE),
        child: Scrollbar(
          isAlwaysShown: Platform.isIOS ? true : false,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                lorem(paragraphs: 4, words: 1000),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      child: Text(
        lorem(
          paragraphs: 1,
          words: 12,
        ),
      ),
    );
  }
}

class _TitleBar extends StatelessWidget {
  const _TitleBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
            child: Text(
              'Title',
              style: ProjectStyle.title,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: MyCloseButton(
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }
}
