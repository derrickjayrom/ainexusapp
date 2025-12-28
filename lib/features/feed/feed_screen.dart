import 'package:ainexusapp/design/tokens/app_colors.dart';
import 'package:ainexusapp/design/tokens/app_spacing.dart';
import 'package:ainexusapp/design/widgets/news_card.dart';
import 'package:ainexusapp/design/widgets/pill.dart';
import 'package:ainexusapp/design/widgets/section_header.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

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
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primary.withValues(alpha: 0.25),
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
                    Text(
                      "Good Morning,",
                      style: t.bodyMedium?.copyWith(color: AppColors.textMuted),
                    ),
                    Text(
                      "Alex",
                      style: t.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Pill("All News", isActive: true, onTap: () {}),
                const SizedBox(width: 10),
                Pill("Tools", onTap: () {}),
                const SizedBox(width: 10),
                Pill("Research", onTap: () {}),
                const SizedBox(width: 10),
                Pill("Business", onTap: () {}),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          SectionHeader(
            title: "Breaking News",
            trailing: LinkText("View all", onTap: () {}),
          ),
          const SizedBox(height: 12),

          NewsCard(
            title: "GPT-5 Official Release Date Confirmed for Late 2024",
            subtitle:
                "Major updates expected across reasoning and multimodal capabilities.",
            source: "OpenAI",
            timeAgo: "12m ago",
            isLive: true,
          ),

          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              const Icon(Icons.circle, size: 8, color: AppColors.primary),
              const SizedBox(width: 10),
              Text(
                "Today",
                style: t.titleMedium?.copyWith(fontWeight: FontWeight.w900),
              ),
            ],
          ),
          const SizedBox(height: 12),

          NewsCard(
            title: "Midjourney V7 Alpha Testing Begins with Video Support",
            subtitle:
                "Users report stunning consistency improvements and better motion handling.",
            source: "The Verge",
            timeAgo: "45m ago",
            compact: true,
          ),
          const SizedBox(height: 12),
          NewsCard(
            title: "Copilot X Integration Now Live in VS Code",
            subtitle:
                "Seamless context awareness for multi-file edits and refactors.",
            source: "TechCrunch",
            timeAgo: "2h ago",
            compact: true,
          ),
          const SizedBox(height: 12),
          NewsCard(
            title:
                "Claude 3.5 Opus just dropped: Outperforms GPT-4 on Math benchmarks",
            subtitle:
                "Anthropic’s latest model features significant reasoning improvements and 200k context.",
            source: "Product Hunt",
            timeAgo: "3h ago",
            compact: true,
          ),

          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              const Icon(Icons.circle, size: 8, color: AppColors.textMuted),
              const SizedBox(width: 10),
              Text(
                "Yesterday",
                style: t.titleMedium?.copyWith(fontWeight: FontWeight.w900),
              ),
            ],
          ),
          const SizedBox(height: 12),
          NewsCard(
            title: "Global AI Regulation Summit Concludes in Geneva",
            subtitle:
                "World leaders agree on new safety principles and reporting expectations.",
            source: "Nature",
            timeAgo: "1d ago",
            compact: true,
          ),
        ],
      ),
    );
  }
}
