import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../constant/colors.dart';
import '../constant/styles.dart';
import '../providers/horizontal_items.dart';
import '../providers/vertical_items.dart';
import '../widgets/close_button_widget.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key key}) : super(key: key);

  static const routeName = '/screen_2';

  @override
  Widget build(BuildContext context) {
    final _horizontalItemCount =
        context.watch<HorizontalItemsProvider>().itemsCount;
    final _verticalItemCount =
        context.watch<VerticalItemsProvider>().itemsCount;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ProjectColor.white,
        body: ListView(children: [
          Align(
            alignment: Alignment.centerRight,
            child: MyCloseButton(
              onTap: () => Navigator.of(context).pop(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Section 1 ($_horizontalItemCount)',
              style: ProjectStyle.title,
            ),
          ),
          HorizontalSection(_horizontalItemCount),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Section 2 ($_verticalItemCount)',
              style: ProjectStyle.title,
            ),
          ),
          const Gap(8),
          VerticalSection(_verticalItemCount),
        ]),
      ),
    );
  }
}

class HorizontalSection extends StatelessWidget {
  const HorizontalSection(this._itemCount, {Key key}) : super(key: key);
  final int _itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 182,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _itemCount,
        itemBuilder: _horizontalItem,
      ),
    );
  }
}

Widget _horizontalItem(BuildContext context, int index) {
  final _width = MediaQuery.of(context).size.width;
  return Container(
    height: 182,
    width: _width - 64,
    margin:
        EdgeInsets.only(top: 16.0, bottom: 16.0, left: index == 0 ? 32 : 16),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(16),
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 12,
          color: Colors.black.withOpacity(0.25),
          // offset: const Offset(2, 2),
        ),
      ],
    ),
    child: Container(
      
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          context.watch<HorizontalItemsProvider>().generateItemAt(index),
          style: ProjectStyle.title,
        ),
      ),
    ),
  );
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
      itemBuilder: _verticalItem,
    );
  }
}

Widget _verticalItem(BuildContext context, int index) {
  return Container(
    height: 150,
    margin: const EdgeInsets.symmetric(
      vertical: 8,
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(16),
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 12,
          color: Colors.black.withOpacity(0.25),
          // offset: const Offset(2, 2),
        ),
      ],
    ),
    child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          context.watch<VerticalItemsProvider>().generateItemAt(index),
          style: ProjectStyle.title,
        ),
      ),
    ),
  );
}
