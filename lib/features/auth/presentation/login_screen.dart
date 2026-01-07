import 'package:ainexusapp/design/tokens/app_colors.dart';
import 'package:ainexusapp/design/tokens/app_spacing.dart';
import 'package:ainexusapp/design/widgets/app_background.dart';
import 'package:ainexusapp/design/widgets/primary_button.dart';
import 'package:ainexusapp/design/widgets/segmented_tabs.dart';
import 'package:ainexusapp/features/auth/state/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.xl,
              AppSpacing.lg,
              AppSpacing.xl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App icon
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.55),
                    ),
                  ),
                  child: const Icon(
                    Icons.smart_toy_outlined,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),

                Text("Welcome to", style: t.headlineLarge),
                const SizedBox(height: 6),
                Text("AI Nexus", style: t.headlineLarge),
                const SizedBox(height: AppSpacing.md),
                Text(
                  "Stay ahead with the latest AI breakthroughs.",
                  style: t.bodyLarge,
                ),

                const SizedBox(height: AppSpacing.lg),
                SegmentedTabs(
                  left: "Log In",
                  right: "Sign Up",
                  isLeftSelected: isLogin,
                  onLeft: () => setState(() => isLogin = true),
                  onRight: () => setState(() => isLogin = false),
                ),

                const SizedBox(height: AppSpacing.lg),
                Text(
                  "EMAIL OR USERNAME",
                  style: (t.labelLarge ?? const TextStyle()).copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "name@example.com",
                    prefixIcon: Icon(Icons.mail_outline),
                  ),
                ),

                const SizedBox(height: AppSpacing.md),
                Text(
                  "PASSWORD",
                  style: (t.labelLarge ?? const TextStyle()).copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "••••••••",
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.sm),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Forgot Password?"),
                  ),
                ),

                const SizedBox(height: AppSpacing.md),
                PrimaryButton(
                  label: isLogin ? "Log In" : "Sign Up",
                  onPressed: () async {
                    await ref
                        .read(authControllerProvider.notifier)
                        .signIn("demo@x.com", "password");

                    if (!context.mounted) return;
                    context.go('/app/feed');
                  },
                  trailing: const Icon(Icons.arrow_forward, size: 18),
                ),

                const SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.stroke.withValues(alpha: 0.8),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "OR CONTINUE WITH",
                        style: TextStyle(color: AppColors.textMuted),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.stroke.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Expanded(
                      child: _SocialButton(
                        icon: Icons.g_mobiledata,
                        label: "Google",
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: _SocialButton(
                        icon: Icons.apple,
                        label: "Apple",
                        onTap: () {},
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.lg),
                Center(
                  child: Text(
                    "By continuing, you agree to our\nTerms of Service and Privacy Policy.",
                    textAlign: TextAlign.center,
                    style: t.bodyMedium?.copyWith(color: AppColors.textMuted),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: isDark ? AppColors.surface2Dark : AppColors.surface2Light,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isDark ? AppColors.strokeDark : AppColors.strokeLight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isDark ? AppColors.strokeDark : AppColors.strokeLight,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: isDark ? AppColors.strokeDark : AppColors.strokeLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
