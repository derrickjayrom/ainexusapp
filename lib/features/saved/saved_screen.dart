import 'package:ainexusapp/design/tokens/app_spacing.dart';
import 'package:ainexusapp/design/widgets/news_card.dart';
import 'package:ainexusapp/design/widgets/pill.dart';
import 'package:ainexusapp/design/widgets/section_header.dart';
import 'package:flutter/material.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  int tab = 0; // 0 All, 1 Articles, 2 Tools, 3 Videos

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
              Expanded(
                child: Text(
                  "Saved Items",
                  style: t.headlineLarge?.copyWith(fontSize: 30),
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            ],
          ),
          const SizedBox(height: 6),
          Text("12 Articles • 5 Tools", style: t.bodyMedium),
          const SizedBox(height: AppSpacing.md),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Pill(
                  "All",
                  isActive: tab == 0,
                  onTap: () => setState(() => tab = 0),
                ),
                const SizedBox(width: 10),
                Pill(
                  "Articles",
                  isActive: tab == 1,
                  onTap: () => setState(() => tab = 1),
                ),
                const SizedBox(width: 10),
                Pill(
                  "Tools",
                  isActive: tab == 2,
                  onTap: () => setState(() => tab = 2),
                ),
                const SizedBox(width: 10),
                Pill(
                  "Videos",
                  isActive: tab == 3,
                  onTap: () => setState(() => tab = 3),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.lg),
          SectionHeader(
            title: "Recently Saved",
            trailing: LinkText("Edit", onTap: () {}),
          ),
          const SizedBox(height: 12),

          NewsCard(
            title: "Midjourney V7 Alpha Testing Begins with Video Support",
            subtitle:
                "Users report stunning consistency improvements and better motion handling.",
            source: "The Verge",
            timeAgo: "2h ago",
            compact: true,
          ),
          const SizedBox(height: 12),
          NewsCard(
            title: "Claude 3.5 Opus just dropped: Outperforms GPT-4",
            subtitle:
                "Latest model shows significant reasoning improvements and a larger context window.",
            source: "Product Hunt",
            timeAgo: "—",
            compact: true,
          ),

          const SizedBox(height: AppSpacing.lg),
          SectionHeader(title: "Previous Week"),
          const SizedBox(height: 12),

          NewsCard(
            title: "Copilot X Integration Now Live in VS Code",
            subtitle:
                "Seamless context awareness for multi-file edits and refactors.",
            source: "TechCrunch",
            timeAgo: "5d ago",
            compact: true,
          ),
          const SizedBox(height: 12),
          NewsCard(
            title: "Global AI Regulation Summit Concludes in Geneva",
            subtitle:
                "World leaders agree on new safety principles and reporting expectations.",
            source: "Nature",
            timeAgo: "1w ago",
            compact: true,
          ),
        ],
      ),
    );
  }
}
