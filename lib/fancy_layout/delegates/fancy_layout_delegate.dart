import 'package:flutter/material.dart';

class FancyLayoutDelegate extends MultiChildLayoutDelegate {
  final Offset offsetBetweenWidgets;
  final Offset padding;
  final Iterable<String> ids;

  final List<_LayoutRow> _rows = [];

  FancyLayoutDelegate(this.ids, this.offsetBetweenWidgets, this.padding);

  @override
  void performLayout(Size size) {
    int currentRow = 0;
    int rowIndex = 0;
    _rows.add(_LayoutRow());

    for (var id in ids) {
      final Size currentSize = layoutChild(
          id, BoxConstraints(maxHeight: size.height, maxWidth: size.width));

      Offset position = padding;

      double x = 0;
      if (rowIndex != 0) {
        final previousInfo = _rows[currentRow].infos[rowIndex - 1];
        x = previousInfo.offset.dx + previousInfo.size.width;
        x += offsetBetweenWidgets.dx;
      }

      position = _calcOffset(
          x, currentSize, currentRow == 0 ? null : _rows[currentRow - 1]);

      if (position.dx + currentSize.width >= size.width - padding.dx) {
        _rows.add(_LayoutRow());
        rowIndex = 0;
        currentRow++;

        final aboveRow = _rows[currentRow - 1];
        position = _calcOffset(0, currentSize, aboveRow);
      }

      positionChild(id, position);
      _rows[currentRow].infos.add(_LayoutInfo(position, currentSize));

      rowIndex++;
    }

    _rows.clear();
  }

  Offset _calcOffset(double x, Size size, _LayoutRow? aboveRow) {
    double? properY = 0;
    double thisRightBound = x + size.width;

    if (aboveRow == null) {
      return Offset(x, 0);
    }

    for (int i = 0; i < aboveRow.infos.length; i++) {
      final info = aboveRow.infos[i];

      double infoRightBound = info.offset.dx + info.size.width;

      if (info.offset.dx < thisRightBound && infoRightBound > x) {
        double proposedY =
            info.offset.dy + offsetBetweenWidgets.dy + info.size.height;
        if (properY == null || proposedY > properY) {
          properY = proposedY;
        }
      }
    }

    return Offset(x, properY!);
  }

  @override
  bool shouldRelayout(FancyLayoutDelegate oldDelegate) {
    return oldDelegate.ids.length != oldDelegate.ids.length;
  }
}

class _LayoutInfo {
  final Offset offset;
  final Size size;

  _LayoutInfo(this.offset, this.size);
}

class _LayoutRow {
  final List<_LayoutInfo> infos = [];
}
