import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// A widget that wraps another widget and reports any offset changes via a RenderOffsetReportingBox.
class OffsetReportingWidget extends SingleChildRenderObjectWidget {
  /// Callback that could be executed when the widget changes its offset
  /// This callback provides the new offset through this property
  final ValueChanged<Offset>? onOffsetChanged;

  /// Creates a new OffsetReportingWidget widget.
  const OffsetReportingWidget({
    Key? key,
    required Widget child,
    this.onOffsetChanged,
  }) : super(key: key, child: child);

  /// Creates the RenderObject that will be used to render this widget.
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderOffsetReportingBox(
      offsetChanged: onOffsetChanged,
    ); // Uses a RenderOffsetReportingBox to report offset changes.
  }
}

/// A subclass of RenderProxyBox that adds the ability to report offset changes in a widget.
class RenderOffsetReportingBox extends RenderProxyBox {
  /// Callback that will be executed when the offset of the widget has been changed
  /// This callback is provided by the [OffsetReportingWidget]
  final ValueChanged<Offset>? offsetChanged;

  /// The previous offset of the widget that will perform layout
  Offset? _currentOffset;

  /// Constructor for the RenderOffsetReportingBox class.
  RenderOffsetReportingBox({this.offsetChanged});

  /// Method called when widget layout is being performed.
  @override
  void performLayout() {
    super.performLayout();

    final offset = localToGlobal(Offset.zero);

    // while (offset == Offset.zero) {
      if (offset != _currentOffset) {
        _currentOffset = offset;
        offsetChanged?.call(offset);
      }
    // }
  }
}
