import 'package:flutter/cupertino.dart';

import '../Page/grocery_store_home.dart';

class StaggeredDualView extends StatelessWidget {
  final IndexedWidgetBuilder itemBuider;
  final int itemCount;
  final double spacing;
  final double aspectRatio;
  final double offsetPercent;

  const StaggeredDualView(
      {Key? key,
      required this.itemBuider,
      required this.itemCount,
      this.offsetPercent = 0.5,
      this.spacing = 0.0,
      this.aspectRatio = 0.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final itemHeight = (width * 0.5)/aspectRatio;
        return OverflowBox(
          maxHeight: height,
          maxWidth: width,
          minHeight: height,
          minWidth: width,
          child: GridView.builder(
              padding: EdgeInsets.only(top: itemHeight/2-50, bottom: itemCount.isOdd ? 0 : itemHeight/2),
              itemCount: itemCount,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: aspectRatio,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing),
              itemBuilder: (context, index) {
                return Transform.translate(
                  offset: Offset(0.0, index.isOdd ? itemHeight*offsetPercent : 0),
                  child: itemBuider(context, index),
                );
              }),
        );
      }
    );
  }
}
