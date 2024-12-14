import 'package:dnd_tracker/movable_widget.dart';
import 'package:dnd_tracker/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:dnd_tracker/home/spell_library.dart';
import 'package:dnd_tracker/home/home_title_bar.dart';
import 'package:dnd_tracker/resource_widget.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const HomeTitleBar(),
        // title: ElevatedButton(
        //     onPressed: () {
        //       crossAxisCount++;
        //       movableWidgets.add(const ResourceWidget());
        //     },
        //     child: null),
      ),
      body: Center(child: _NewHomeLayout()

          // child: StaggeredGrid.count(
          //   crossAxisCount: 3,
          //   mainAxisSpacing: 0,
          //   crossAxisSpacing: 0,
          //
          //   children: const [
          //     StaggeredGridTile.count(crossAxisCellCount: 1, mainAxisCellCount: 1, child: ResourceWidget()),
          //     StaggeredGridTile.count(crossAxisCellCount: 1, mainAxisCellCount: 2, child: ResourceWidget()),
          //     StaggeredGridTile.count(crossAxisCellCount: 1, mainAxisCellCount: 1, child: ResourceWidget()),
          //     StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 1, child: ResourceWidget()),
          //     StaggeredGridTile.count(crossAxisCellCount: 1, mainAxisCellCount: 1, child: ResourceWidget()),
          //   ],
          //
          // ),

          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: <Widget>[
          //     ResourceWidget(),
          //     SpellLibrary(),
          //   ],
          // ),
          ),
    );
  }
}

class _HomeLayout extends StatefulWidget {
  //number of childs used in the example
  static const itemCount = 8;

  @override
  State<_HomeLayout> createState() => _HomeLayoutState();
}

class _NewHomeLayout extends StatelessWidget {
  final Map<String, MovableWidget> _movableWidgets = <String, MovableWidget>{
    '1': ResourceWidget(),
    '2': TestWidget(),
    '3': ResourceWidget(),
    '4': ResourceWidget(),
    '5': ResourceWidget(),
    '6': TestWidget(),
  };

  _NewHomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: _CascadeLayoutDelegate(_movableWidgets.keys.toList()),
      children: <Widget>[
        // Create all of the colored boxes in the colors map.
        for (final MapEntry<String, MovableWidget> entry
            in _movableWidgets.entries)
          // The "id" can be any Object, not just a String.
          LayoutId(
            id: entry.key,
            child: entry.value,
          ),
      ],
    );
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

class _CascadeLayoutDelegate extends MultiChildLayoutDelegate {

  static const double xOffset = 2;
  static const double yOffset = 2;

  final List<String> ids;

  final List<_LayoutRow> _rows = [];

  _CascadeLayoutDelegate(this.ids);

  // Perform layout will be called when re-layout is needed.
  @override
  void performLayout(Size size) {
    int currentRow = 0;
    int rowIndex = 0;
    _rows.add(_LayoutRow());

    for (int i = 0; i < ids.length; i++) {
      final currentID = ids[i];
      final Size currentSize = layoutChild(currentID,
          BoxConstraints(maxHeight: size.height, maxWidth: size.width));

      Offset position = const Offset(2,0);

      double x = 0;
      if (rowIndex != 0) {
        final previousInfo = _rows[currentRow].infos[rowIndex - 1];
        x = previousInfo.offset.dx + previousInfo.size.width;
        x += rowIndex * xOffset;
      }

      position = getProperOffset(
          x, currentSize, currentRow == 0 ? null : _rows[currentRow - 1]);

      if (position.dx + currentSize.width >= size.width) {
        _rows.add(_LayoutRow());
        rowIndex = 0;
        currentRow++;

        final aboveRow = _rows[currentRow - 1];
        position = getProperOffset(0, currentSize, aboveRow);
      }

      positionChild(currentID, position);
      _rows[currentRow].infos.add(_LayoutInfo(position, currentSize));
      rowIndex++;
    }

    _rows.clear();
  }

  Offset getProperOffset(double x, Size size, _LayoutRow? aboveRow) {
    double? properY = 0;
    double thisRightBound = x + size.width;

    if (aboveRow == null) {
      return Offset(x, 0);
    }

    for (int i = 0; i < aboveRow.infos.length; i++) {
      final info = aboveRow.infos[i];

      double infoRightBound = info.offset.dx + info.size.width;

      if (info.offset.dx < thisRightBound && infoRightBound > x) {
        double proposedY = info.offset.dy + yOffset + info.size.height;
        if (properY == null || proposedY > properY) {
          properY = proposedY;
        }
      }
    }

    return Offset(x, properY!);
  }

  // shouldRelayout is called to see if the delegate has changed and requires a
  // layout to occur. Should only return true if the delegate state itself
  // changes: changes in the CustomMultiChildLayout attributes will
  // automatically cause a relayout, like any other widget.
  @override
  bool shouldRelayout(_CascadeLayoutDelegate oldDelegate) {
    return oldDelegate.ids.length != oldDelegate.ids.length;
  }
}

class _HomeLayoutState extends State<_HomeLayout> {
//list of each bloc expandable state, that is changed to trigger the animation of the AnimatedContainer
  List<bool> expandableState =
      List.generate(_HomeLayout.itemCount, (index) => false);

  Widget bloc(double width, int index) {
    bool isExpanded = expandableState[index];

    return GestureDetector(
      onTap: () {
        setState(() {
          //changing the current expandableState
          expandableState[index] = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: const EdgeInsets.all(20.0),
        width: !isExpanded ? width * 0.4 : width * 0.8,
        height: !isExpanded ? width * 0.4 : width * 0.8,
        color: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Align(
        child: SingleChildScrollView(
          child: Wrap(
            children: List.generate(_HomeLayout.itemCount, (index) {
              return bloc(width, index);
            }),
          ),
        ),
      ),
    );
  }
}
