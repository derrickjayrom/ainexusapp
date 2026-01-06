import 'package:ainexusapp/design/tokens/app_colors.dart';
import 'package:ainexusapp/design/tokens/app_radius.dart';
import 'package:ainexusapp/design/tokens/app_spacing.dart';
import 'package:ainexusapp/design/widgets/app_background.dart';
import 'package:ainexusapp/design/widgets/primary_button.dart';
import 'package:ainexusapp/features/auth/data/auth_repository.dart';
import 'package:ainexusapp/features/auth/state/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.xl,
              AppSpacing.lg,
              AppSpacing.xl,
            ),
            child: Column(
              children: [
                const Spacer(),
                Text(
                  "Future of AI",
                  style: t.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  "In Your Pocket",
                  style: t.headlineLarge?.copyWith(color: AppColors.primary),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  "Stay ahead with curated news, real-time tool updates, and industry breakthroughs tailored just for you.",
                  style: t.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.xl),

                const _FeatureRow(
                  icon: Icons.rss_feed,
                  title: "Personalized Feed",
                  desc: "Daily AI news curated for your specific interests.",
                ),
                const SizedBox(height: 14),
                const _FeatureRow(
                  icon: Icons.build_circle_outlined,
                  title: "Tool Updates",
                  desc: "Discover emerging AI tools as soon as they launch.",
                ),
                const SizedBox(height: 14),
                _FeatureRow(
                  icon: Icons.bookmark_add_outlined,
                  title: "Save Content",
                  desc: "Build your personal library of insights and research.",
                  onTap: () => context.go(
                    '/app/?saved',
                  ), // or context.go('/app?saved=true') later
                ),

                const Spacer(),
                PrimaryButton(
                  label: "Get Started",
                  trailing: const Icon(Icons.arrow_forward, size: 18),
                  onPressed: () {
                    final auth = ref
                        .read(authStatusProvider)
                        .maybeWhen(
                          data: (v) => v,
                          orElse: () => AuthStatus.unknown,
                        );

                    if (auth == AuthStatus.authenticated) {
                      context.go('/app');
                    } else {
                      context.go('/login');
                    }
                  },
                ),
                const SizedBox(height: 14),

                TextButton(
                  onPressed: () => context.go('/login'),
                  child: const Text(
                    "Already have an account? Log In",
                    style: TextStyle(color: AppColors.textSecondary),
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

class _FeatureRow extends StatelessWidget {
  const _FeatureRow({
    required this.icon,
    required this.title,
    required this.desc,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String desc;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Material(
      borderRadius: AppRadius.rSm,
      color: AppColors.bgBottom.withValues(alpha: 0.4),
      child: InkWell(
        borderRadius: AppRadius.rSm,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: AppColors.surface2.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppColors.stroke),
                ),
                child: Icon(icon, color: AppColors.primary),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: t.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      desc,
                      style: t.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
