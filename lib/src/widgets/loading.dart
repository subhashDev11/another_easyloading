import 'package:flutter/material.dart';

import '../loading_container.dart';
import './overlay_entry.dart';

class LoadingWidget extends StatefulWidget {
  final Widget? child;

  const LoadingWidget({
    super.key,
    required this.child,
  }) : assert(child != null);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  EasyLoadingOverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    // _overlayEntry = EasyLoadingOverlayEntry(
    //   builder: (BuildContext context) => AnotherEasyLoading.instance.w ?? Container(),
    // );
    // AnotherEasyLoading.instance.overlayEntry = _overlayEntry;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _overlayEntry = EasyLoadingOverlayEntry(
        builder: (BuildContext context) =>
            AnotherEasyLoading.instance.w ?? const SizedBox.shrink(),
      );
      AnotherEasyLoading.instance.overlayEntry = _overlayEntry;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FocusScope(
        node: FocusScopeNode(),
        child: Overlay(
          initialEntries: [
            EasyLoadingOverlayEntry(
              builder: (BuildContext context) {
                return widget.child ?? const SizedBox.shrink();
              },
            ),
            if(_overlayEntry!=null)
              _overlayEntry!,
          ],
        ),
      ),
    );
  }
}
