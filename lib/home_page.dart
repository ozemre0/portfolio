import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/l10n/app_localizations.dart';

import 'package:portfolio/widgets/hero_section.dart';
import 'package:portfolio/widgets/project_card.dart';
import 'package:portfolio/widgets/technical_skills.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Slate 900 (Dark Mode Background)
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 60.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000), // Max width for ultrawide screens
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. HEADER / HERO SECTION
                const HeroSection(),
                
                const SizedBox(height: 60),
                
                _buildDivider(),
                
                const SizedBox(height: 40),
                
                // 2. FEATURED PROJECTS SECTION
                Text(
                  l10n.projects,
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2),
                ).animate(delay: 800.ms).fade(duration: 400.ms),
                
                const SizedBox(height: 30),
                
                // Hit Archery
                ProjectCard(
                  title: l10n.hitArcheryTitle,
                  description: l10n.hitArcheryDescription,
                  techStack: l10n.hitArcheryTechStack,
                  youtubeUrl: "https://www.youtube.com/watch?v=fWujl7db_fE&t=1s",
                  appStoreUrl: "https://apps.apple.com/app/hit-archery/id6753947637",
                  googlePlayUrl: "https://play.google.com/store/apps/details?id=com.ozsdigital.hitarchery&hl=en_US",
                  webUrl: "https://hitarchery.com/",
                  sourceUrl: null, // Private repo usually
                ).animate(delay: 900.ms).fade(duration: 400.ms).slideY(begin: 0.1, end: 0),
                
                const SizedBox(height: 32),
                
                // Neon Show
                ProjectCard(
                  title: l10n.neonShowTitle,
                  description: l10n.neonShowDescription,
                  techStack: l10n.neonShowTechStack,
                  imagePaths: const [
                    'assets/images/neon3.png',
                  ],
                  appStoreUrl: "https://apps.apple.com/app/neon-show/id6759206187",
                  googlePlayUrl: "https://play.google.com/store/apps/details?id=com.ozsdigital.neonshow&hl=en_US",
                  sourceUrl: null,
                ).animate(delay: 1000.ms).fade(duration: 400.ms).slideY(begin: 0.1, end: 0),
                
                const SizedBox(height: 32),
                
                // Hit Archery Score
                ProjectCard(
                  title: l10n.hitArcheryScoreTitle,
                  description: l10n.hitArcheryScoreDescription,
                  techStack: l10n.hitArcheryScoreTechStack,
                  appStoreUrl: "https://apps.apple.com/app/hit-archery-score/id6759112947",
                  googlePlayUrl: "https://play.google.com/store/apps/details?id=com.ozsdigital.hitscore&hl=en_US",
                  sourceUrl: null,
                ).animate(delay: 1100.ms).fade(duration: 400.ms).slideY(begin: 0.1, end: 0),
                
                const SizedBox(height: 32),

                // Hosting & SSL Management
                ProjectCard(
                  title: l10n.hostingManagementTitle,
                  subtitle: l10n.hostingManagementSubtitle,
                  description: l10n.hostingManagementDescription,
                  techStack: l10n.hostingManagementTechStack,
                  sourceUrl: "https://github.com/ozemre0/atakan-hosting",
                ).animate(delay: 1200.ms).fade(duration: 400.ms).slideY(begin: 0.1, end: 0),
                
                const SizedBox(height: 60),
                
                _buildDivider(),
                
                const SizedBox(height: 40),
                
                // 3. TECHNICAL SKILLS SECTION
                const TechnicalSkills(),
                
                const SizedBox(height: 80),
                
                // 4. FOOTER / CONTACT
                _buildDivider(),
                
                const SizedBox(height: 40),
                
                Center(
                  child: Column(
                    children: [
                      const Text(
                        "Get In Touch",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "wise.emre1@gmail.com",
                        style: TextStyle(fontSize: 18, color: const Color(0xFF60A5FA).withValues(alpha: 0.9)), // Blue 400
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        "© 2026 Muhammet Emre Oz. All rights reserved.",
                        style: TextStyle(fontSize: 14, color: Color(0xFF64748B)), // Slate 500
                      ),
                    ],
                  ).animate(delay: 1700.ms).fade(duration: 400.ms),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: const Color(0xFF334155), // Slate 700
      thickness: 1,
      height: 1,
    );
  }
}