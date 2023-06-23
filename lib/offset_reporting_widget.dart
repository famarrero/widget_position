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

class RenderOffsetReportingBox extends RenderProxyBox {
  final ValueChanged<Offset>? offsetChanged;
  Offset? _currentOffset;

  RenderOffsetReportingBox({this.offsetChanged});

  @override
  void performLayout() {
    super.performLayout();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final offset = localToGlobal(Offset.zero);
      if (offset != _currentOffset) {
        _currentOffset = offset;
        offsetChanged?.call(offset);
      }
    });
  }
}
