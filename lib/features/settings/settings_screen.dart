import 'package:ainexusapp/design/tokens/app_colors.dart';
import 'package:ainexusapp/design/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

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
                      backgroundColor: AppColors.surface2,
                      child: const Icon(
                        Icons.person_outline,
                        size: 46,
                        color: AppColors.textPrimary,
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
                            color: AppColors.surface2,
                            width: 3,
                          ),
                        ),
                        child: const Icon(
                          Icons.edit,
                          size: 18,
                          color: AppColors.textPrimary,
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
                  style: t.bodyMedium?.copyWith(color: AppColors.textMuted),
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
                icon: Icons.nightlight_round,
                title: "Dark Mode",
                value: true,
                onChanged: (_) {},
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
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.surface.withValues(alpha: 0.75),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: AppColors.stroke),
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

          const SizedBox(height: 18),
          Center(
            child: Text(
              "AI News Feed v2.4.0",
              style: t.bodyMedium?.copyWith(color: AppColors.textMuted),
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
    return Column(
      children: [
        Text(
          value,
          style: t.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
            color: highlight ? AppColors.primary : AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: t.bodyMedium?.copyWith(
            color: AppColors.textMuted,
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
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.stroke),
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
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.surface2,
        child: Icon(icon, color: AppColors.textPrimary),
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
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: AppColors.surface2,
        child: Icon(icon, color: AppColors.textPrimary),
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
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
