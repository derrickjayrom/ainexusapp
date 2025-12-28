import 'package:ainexusapp/design/theme/app_theme.dart';

import 'package:ainexusapp/features/auth/onboarding_screen.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AiNexusApp extends StatelessWidget {
  const AiNexusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ai_Nexus',
      theme: AppTheme.dark(),
      home: const OnboardingScreen(),
      builder: (context, child) {
        final content = child ?? const SizedBox.shrink();

        if (!kDebugMode) return content;

        return DeviceFrame(
          device: Devices.ios.iPhone16ProMax,
          isFrameVisible: true,
          orientation: Orientation.portrait,
          screen: content,
        );
      },
    );
  }
}
