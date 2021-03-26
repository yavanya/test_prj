import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../constant/colors.dart';
import '../constant/styles.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key key}) : super(key: key);

  static const routeName = '/screen_1';

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey,
          body: Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: ProjectColor.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Title',
                        style: ProjectStyle.centerTitle,
                        textAlign: TextAlign.center,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.ac_unit,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 16,
                    ),
                    child: Text(
                      lorem(
                        paragraphs: 1,
                        words: 15,
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 400),
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
                  ),
                  Container(
                    height: 76,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () => null,
                        child: const Text('TEST BUTTON'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
