import 'package:another_easyloading/another_easyloading.dart';
import 'package:flutter/material.dart';

class CustomAnimation extends AnotherEasyLoadingAnimation {

  @override
  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    return Opacity(
      opacity: controller.value,
      child: RotationTransition(
        turns: controller,
        child: child,
      ),
    );
  }
}
