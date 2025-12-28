import 'package:ainexusapp/design/tokens/app_colors.dart';
import 'package:ainexusapp/design/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

class ToolDetailsScreen extends StatelessWidget {
  const ToolDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.md,
            AppSpacing.lg,
            AppSpacing.xl,
          ),
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back),
                ),
                const Expanded(child: SizedBox()),
                IconButton(onPressed: () {}, icon: const Icon(Icons.ios_share)),
              ],
            ),
            const SizedBox(height: 8),

            Center(
              child: Container(
                width: 84,
                height: 84,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  gradient: RadialGradient(
                    colors: [
                      AppColors.primary.withValues(alpha: 0.35),
                      AppColors.surface2,
                    ],
                  ),
                  border: Border.all(color: AppColors.stroke),
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  color: AppColors.textPrimary,
                  size: 34,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Center(
              child: Text(
                "Lumina AI",
                style: t.headlineLarge?.copyWith(fontSize: 30),
              ),
            ),
            const SizedBox(height: 6),
            Center(
              child: Text(
                "Generative Design • Image Editing",
                style: t.bodyMedium,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _StatChip(icon: Icons.star, label: "4.9"),
                const SizedBox(width: 10),
                _StatChip(
                  icon: Icons.download_outlined,
                  label: "12k Downloads",
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: _PrimaryWideButton(
                    label: "Visit Website",
                    icon: Icons.open_in_new,
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 12),
                _SquareButton(icon: Icons.bookmark_border, onTap: () {}),
              ],
            ),

            const SizedBox(height: AppSpacing.lg),
            Text(
              "About",
              style: t.titleMedium?.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 10),
            Text(
              "Lumina AI transforms the way you create visual content. By leveraging advanced diffusion models, it allows designers and marketers to generate high-fidelity assets from simple text prompts.",
              style: t.bodyMedium?.copyWith(color: AppColors.textSecondary),
            ),

            const SizedBox(height: AppSpacing.lg),
            Text(
              "Use Cases",
              style: t.titleMedium?.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                _Tag("Content Creation"),
                _Tag("Marketing"),
                _Tag("UI Design"),
                _Tag("Photography"),
              ],
            ),

            const SizedBox(height: AppSpacing.lg),
            Text(
              "Key Features",
              style: t.titleMedium?.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: const [
                _FeatureTile(
                  icon: Icons.brush_outlined,
                  title: "Smart Edit",
                  desc: "In-painting and removal tools.",
                ),
                _FeatureTile(
                  icon: Icons.palette_outlined,
                  title: "Style Match",
                  desc: "Clone your brand identity.",
                ),
                _FeatureTile(
                  icon: Icons.flash_on_outlined,
                  title: "Fast Gen",
                  desc: "Images in under 2 seconds.",
                ),
                _FeatureTile(
                  icon: Icons.api_outlined,
                  title: "API Access",
                  desc: "Integrate into your workflow.",
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.lg),
            Text(
              "Pricing",
              style: t.titleMedium?.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 12),
            const _PricingRow(
              title: "Starter",
              subtitle: "50 credits / month",
              price: "Free",
            ),
            const SizedBox(height: 12),
            const _PricingRow(
              title: "Pro Unlimited",
              subtitle: "Unlimited generations",
              price: "\$19 / month",
              badge: "POPULAR",
            ),

            const SizedBox(height: AppSpacing.lg),
            Text(
              "Gallery",
              style: t.titleMedium?.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _GalleryItem(icon: Icons.image_outlined),
                  SizedBox(width: 12),
                  _GalleryItem(icon: Icons.auto_awesome),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface2.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.stroke),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.textPrimary),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}

class _PrimaryWideButton extends StatelessWidget {
  const _PrimaryWideButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(width: 10),
            Icon(icon, size: 18, color: AppColors.textPrimary),
          ],
        ),
      ),
    );
  }
}

class _SquareButton extends StatelessWidget {
  const _SquareButton({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          color: AppColors.surface2.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.stroke),
        ),
        child: Icon(icon, color: AppColors.textPrimary),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surface2.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.stroke),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({
    required this.icon,
    required this.title,
    required this.desc,
  });
  final IconData icon;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.stroke),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.surface2.withValues(alpha: 0.95),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.stroke),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: t.titleMedium?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 6),
          Text(
            desc,
            style: t.bodyMedium?.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _PricingRow extends StatelessWidget {
  const _PricingRow({
    required this.title,
    required this.subtitle,
    required this.price,
    this.badge,
  });
  final String title;
  final String subtitle;
  final String price;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.stroke),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.surface2.withValues(alpha: 0.95),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.stroke),
            ),
            child: const Icon(
              Icons.person_outline,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: t.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    if (badge != null) ...[
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.22),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.primary),
                        ),
                        child: Text(
                          badge!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: t.bodyMedium?.copyWith(color: AppColors.textMuted),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: t.titleMedium?.copyWith(fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}

class _GalleryItem extends StatelessWidget {
  const _GalleryItem({required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.stroke),
      ),
      child: Icon(icon, color: AppColors.textPrimary, size: 42),
    );
  }
}
