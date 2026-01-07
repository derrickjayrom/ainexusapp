import 'package:ainexusapp/design/tokens/app_colors.dart';
import 'package:ainexusapp/design/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ainexusapp/features/auth/state/auth_controller.dart';
import 'package:ainexusapp/app/core/theme/theme_providers.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final themeMode = ref.watch(themeProvider);
    final isDark = themeMode == ThemeMode.dark;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          AppSpacing.md,
          AppSpacing.lg,
          AppSpacing.xl,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Profile & Settings",
                style: t.titleLarge?.copyWith(fontWeight: FontWeight.w900),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Help",
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 44,
                      backgroundColor: isDark
                          ? AppColors.surface2Dark
                          : AppColors.surface2Light,
                      child: Icon(
                        Icons.person_outline,
                        size: 46,
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isDark
                                ? AppColors.surface2Dark
                                : AppColors.surface2Light,
                            width: 3,
                          ),
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 18,
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  "Alex",
                  style: t.titleLarge?.copyWith(fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 4),
                Text(
                  "alex.dev@example.com",
                  style: t.bodyMedium?.copyWith(
                    color: isDark
                        ? AppColors.textMutedDark
                        : AppColors.textMutedLight,
                  ),
                ),
                const SizedBox(height: 18),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Metric(value: "142", label: "READ"),
                    const SizedBox(width: 16),
                    _Metric(value: "28", label: "SAVED"),
                    const SizedBox(width: 16),
                    _Metric(value: "Pro", label: "PLAN", highlight: true),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.lg),
          Text("APP PREFERENCES", style: t.labelLarge),
          const SizedBox(height: 10),
          _Panel(
            children: [
              _SwitchRow(
                icon: isDark ? Icons.nightlight_round : Icons.light_mode,
                title: isDark ? "Dark Mode" : "Light Mode",
                value: isDark,
                onChanged: (_) =>
                    ref.read(themeProvider.notifier).toggleTheme(),
              ),
              _NavRow(
                icon: Icons.notifications_none,
                title: "Notifications",
                trailingText: "On",
                onTap: () {},
              ),
              _NavRow(
                icon: Icons.tune,
                title: "Feed Preferences",
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.lg),
          Text("ACCOUNT", style: t.labelLarge),
          const SizedBox(height: 10),
          _Panel(
            children: [
              _NavRow(
                icon: Icons.person_outline,
                title: "Personal Info",
                onTap: () {},
              ),
              _NavRow(
                icon: Icons.workspace_premium_outlined,
                title: "Subscription",
                trailingText: "PRO",
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.lg),
          Text("LEGAL & SUPPORT", style: t.labelLarge),
          const SizedBox(height: 10),
          _Panel(
            children: [
              _NavRow(
                icon: Icons.privacy_tip_outlined,
                title: "Privacy Policy",
                onTap: () {},
                external: true,
              ),
              _NavRow(
                icon: Icons.description_outlined,
                title: "Terms of Service",
                onTap: () {},
                external: true,
              ),
              _NavRow(
                icon: Icons.help_outline,
                title: "Help Center",
                onTap: () {},
                external: true,
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.lg),
          GestureDetector(
            onTap: () {
              ref.read(authControllerProvider.notifier).signOut();
            },
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: (isDark ? AppColors.surfaceDark : AppColors.surfaceLight)
                    .withValues(alpha: 0.75),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: isDark ? AppColors.strokeDark : AppColors.strokeLight,
                ),
              ),
              child: Center(
                child: Text(
                  "Log Out",
                  style: t.titleMedium?.copyWith(
                    color: AppColors.danger,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 18),
          Center(
            child: Text(
              "AI News Feed v2.4.0",
              style: t.bodyMedium?.copyWith(
                color: isDark
                    ? AppColors.textMutedDark
                    : AppColors.textMutedLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({
    required this.value,
    required this.label,
    this.highlight = false,
  });
  final String value;
  final String label;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Text(
          value,
          style: t.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
            color: highlight
                ? AppColors.primary
                : (isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: t.bodyMedium?.copyWith(
            color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _Panel extends StatelessWidget {
  const _Panel({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: (isDark ? AppColors.surfaceDark : AppColors.surfaceLight)
            .withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: isDark ? AppColors.strokeDark : AppColors.strokeLight,
        ),
      ),
      child: Column(children: children),
    );
  }
}

class _SwitchRow extends StatelessWidget {
  const _SwitchRow({
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });
  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isDark
            ? AppColors.surface2Dark
            : AppColors.surface2Light,
        child: Icon(
          icon,
          color: isDark
              ? AppColors.textPrimaryDark
              : AppColors.textPrimaryLight,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
      ),
      trailing: Switch(value: value, onChanged: onChanged),
    );
  }
}

class _NavRow extends StatelessWidget {
  const _NavRow({
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailingText,
    this.external = false,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final String? trailingText;
  final bool external;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: isDark
            ? AppColors.surface2Dark
            : AppColors.surface2Light,
        child: Icon(
          icon,
          color: isDark
              ? AppColors.textPrimaryDark
              : AppColors.textPrimaryLight,
        ),
      ),
      title: Text(
        title,
        style: t.titleMedium?.copyWith(fontWeight: FontWeight.w900),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: .18),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.5),
                ),
              ),
              child: Text(
                trailingText!,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: AppColors.primary,
                ),
              ),
            ),
          const SizedBox(width: 8),
          Icon(
            external ? Icons.open_in_new : Icons.chevron_right,
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ],
      ),
    );
  }
}
