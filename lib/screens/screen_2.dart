import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../constant/colors.dart';
import '../constant/styles.dart';
import '../providers/horizontal_items.dart';
import '../providers/vertical_items.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key key}) : super(key: key);

  static const routeName = '/screen_2';

  @override
  Widget build(BuildContext context) {
    final _horizontalItemCount =
        context.watch<HorizontalItemsProvider>().itemsCount;
    final _verticalItemCount =
        context.watch<VerticalItemsProvider>().itemsCount;
    return Scaffold(
      backgroundColor: ProjectColor.white,
      body: ListView(children: [
        Text(
          'Section 1 ($_horizontalItemCount)',
          style: ProjectStyle.centerTitle,
        ),
        HorizontalSection(_horizontalItemCount),
        Text(
          'Section 2 ($_verticalItemCount)',
          style: ProjectStyle.centerTitle,
        ),
        VerticalSection(_verticalItemCount),
      ]),
    );
  }
}

class HorizontalSection extends StatelessWidget {
  const HorizontalSection(this._itemCount, {Key key}) : super(key: key);
  final int _itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _itemCount,
        itemBuilder: (context, index) => Text(
          context.watch<HorizontalItemsProvider>().generateItemAt(index),
        ),
      ),
    );
  }
}

class VerticalSection extends StatelessWidget {
  const VerticalSection(this._itemCount, {Key key}) : super(key: key);
  final int _itemCount;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _itemCount,
      itemBuilder: (context, index) => Text(
        context.watch<VerticalItemsProvider>().generateItemAt(index),
      ),
    );
  }
}
