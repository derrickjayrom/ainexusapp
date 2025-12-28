import 'dart:ui';
import 'package:flutter/material.dart';
import '../tokens/app_colors.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [const _GradientBase(), const _GlowCenter(), child]);
  }
}

class _GradientBase extends StatelessWidget {
  const _GradientBase();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.bgTop, AppColors.bgMid, AppColors.bgBottom],
        ),
      ),
      child: const SizedBox.expand(),
    );
  }
}

class _GlowCenter extends StatelessWidget {
  const _GlowCenter();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Center(
        child: ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              width: 420,
              height: 420,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: .20),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
