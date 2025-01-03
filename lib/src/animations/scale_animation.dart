import 'package:flutter/widgets.dart';

import 'animation.dart';

class ScaleAnimation extends AnotherEasyLoadingAnimation {
  ScaleAnimation();

  @override
  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    return Opacity(
      opacity: controller.value,
      child: ScaleTransition(
        scale: controller,
        child: child,
      ),
    );
  }
}
