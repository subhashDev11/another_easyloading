import 'package:flutter/material.dart';

import '../loading_container.dart';
import './overlay_entry.dart';

class LoadingWidget extends StatefulWidget {
  final Widget? child;

  const LoadingWidget({
    super.key,
    required this.child,
  })  : assert(child != null);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  late EasyLoadingOverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    _overlayEntry = EasyLoadingOverlayEntry(
      builder: (BuildContext context) => AnotherEasyLoading.instance.w ?? Container(),
    );
    AnotherEasyLoading.instance.overlayEntry = _overlayEntry;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Overlay(
        initialEntries: [
          EasyLoadingOverlayEntry(
            builder: (BuildContext context) {
              if (widget.child != null) {
                return widget.child!;
              } else {
                return Container();
              }
            },
          ),
          _overlayEntry,
        ],
      ),
    );
  }
}
