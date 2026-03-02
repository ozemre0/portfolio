import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IDENTITY SECTION
            Text(
              l10n.name,
              style: TextStyle(fontSize: 56, fontWeight: FontWeight.w900, color: Colors.grey.shade900, letterSpacing: -2),
            ).animate().fade(duration: 400.ms).slideX(begin: -0.1, end: 0),
            
            const SizedBox(height: 6),
            
            Text(
              l10n.subtitle,
              style: TextStyle(fontSize: 22, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
            ).animate(delay: 200.ms).fade(duration: 400.ms).slideX(begin: -0.1, end: 0),

            const SizedBox(height: 8),

            Text(
              l10n.focus,
              style: TextStyle(fontSize: 16, color: const Color(0xFF6366F1), fontWeight: FontWeight.bold),
            ).animate(delay: 300.ms).fade(duration: 400.ms).slideX(begin: -0.1, end: 0),
            
            const SizedBox(height: 20),
            
            Text(
              l10n.about,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700, height: 1.6),
            ).animate(delay: 350.ms).fade(duration: 400.ms).slideX(begin: -0.1, end: 0),
            
            const SizedBox(height: 30),
            
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
              height: 40,
            ),

            // LINKS SECTION
            Text(
              l10n.links,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.grey.shade900, letterSpacing: 2),
            ).animate(delay: 400.ms).fade(duration: 400.ms),
            
            const SizedBox(height: 30),

            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildLinkButton(l10n.github, "https://github.com/ozemre0", context).animate(delay: 500.ms).fade().scale(),
                _buildLinkButton(l10n.linkedin, "https://www.linkedin.com/in/emre-oz-4ab357283/", context).animate(delay: 600.ms).fade().scale(),
              ],
            ),
            
            const SizedBox(height: 30),
            
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
              height: 40,
            ),
            
            // PROJECTS SECTION
            Text(
              l10n.projects,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.grey.shade900, letterSpacing: 2),
            ).animate(delay: 800.ms).fade(duration: 400.ms),
            
            const SizedBox(height: 30),
            
            _buildProjectCard(
              title: l10n.hitArcheryTitle,
              description: l10n.hitArcheryDescription,
              techStack: l10n.hitArcheryTechStack,
              githubUrl: null,
              l10n: l10n,
              context: context,
            ).animate(delay: 900.ms).fade(duration: 400.ms).slideY(begin: 0.1, end: 0),
            
            const SizedBox(height: 16),
            
            _buildAppLinks(
              appName: l10n.hitArchery,
              appStoreUrl: "https://apps.apple.com/app/hit-archery/id6753947637",
              googlePlayUrl: "https://play.google.com/store/apps/details?id=com.ozsdigital.hitarchery&hl=en_US",
              webUrl: "https://hitarchery.com/",
              l10n: l10n,
              context: context,
              delay: 950,
            ),
            
            const SizedBox(height: 20),
            
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
              height: 40,
            ),
            
            _buildProjectCard(
              title: l10n.hitArcheryScoreTitle,
              description: l10n.hitArcheryScoreDescription,
              techStack: l10n.hitArcheryScoreTechStack,
              githubUrl: null,
              l10n: l10n,
              context: context,
            ).animate(delay: 1000.ms).fade(duration: 400.ms).slideY(begin: 0.1, end: 0),
            
            const SizedBox(height: 16),
            
            _buildAppLinks(
              appName: l10n.hitArcheryScore,
              appStoreUrl: "https://apps.apple.com/app/hit-archery-score/id6759112947",
              googlePlayUrl: "https://play.google.com/store/apps/details?id=com.ozsdigital.hitscore&hl=en_US",
              l10n: l10n,
              context: context,
              delay: 1050,
            ),
            
            const SizedBox(height: 20),
            
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
              height: 40,
            ),
            
            _buildProjectCard(
              title: l10n.neonShowTitle,
              description: l10n.neonShowDescription,
              techStack: l10n.neonShowTechStack,
              githubUrl: null,
              l10n: l10n,
              context: context,
            ).animate(delay: 1100.ms).fade(duration: 400.ms).slideY(begin: 0.1, end: 0),
            
            const SizedBox(height: 16),
            
            _buildAppLinks(
              appName: l10n.neonShow,
              appStoreUrl: "https://apps.apple.com/app/neon-show/id6759206187",
              googlePlayUrl: "https://play.google.com/store/apps/details?id=com.ozsdigital.neonshow&hl=en_US",
              l10n: l10n,
              context: context,
              delay: 1150,
            ),
            
            const SizedBox(height: 20),
            
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
              height: 40,
            ),
            
            _buildProjectCard(
              title: l10n.hostingManagementTitle,
              subtitle: l10n.hostingManagementSubtitle,
              description: l10n.hostingManagementDescription,
              techStack: l10n.hostingManagementTechStack,
              githubUrl: null,
              l10n: l10n,
              context: context,
            ).animate(delay: 1200.ms).fade(duration: 400.ms).slideY(begin: 0.1, end: 0),
            
            const SizedBox(height: 16),
            
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildLinkButton(l10n.viewOnGitHub, "https://github.com/ozemre0/atakan-hosting", context).animate(delay: 1250.ms).fade().scale(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Project Card
  Widget _buildProjectCard({
    required String title,
    String? subtitle,
    required String description,
    required String techStack,
    String? githubUrl,
    required AppLocalizations l10n,
    required BuildContext context,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey.shade900),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ],
                ),
              ),
              if (githubUrl != null)
                IconButton(
                  onPressed: () => _launchURL(githubUrl, context),
                  icon: Icon(Icons.code, color: Colors.grey.shade700, size: 20),
                  tooltip: l10n.viewOnGitHub,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade700, height: 1.6),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: techStack.split(' • ').map((tech) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF6366F1).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFF6366F1).withOpacity(0.2), width: 1),
                ),
                child: Text(
                  tech,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF6366F1)),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Link Button Design
  Widget _buildLinkButton(String title, String url, BuildContext context) {
    return OutlinedButton(
      onPressed: () => _launchURL(url, context),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.grey.shade900,
        side: BorderSide(color: Colors.grey.shade300, width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.white,
      ).copyWith(
        overlayColor: WidgetStateProperty.all(const Color(0xFF6366F1).withOpacity(0.1)),
      ),
      child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1, color: Colors.grey.shade900)),
    );
  }

  // App Links Widget for better responsive design
  Widget _buildAppLinks({
    required String appName,
    required String appStoreUrl,
    required String googlePlayUrl,
    String? webUrl,
    required AppLocalizations l10n,
    required BuildContext context,
    required int delay,
  }) {
    final List<Widget> buttons = [
      _buildLinkButton("$appName (iOS)", appStoreUrl, context).animate(delay: delay.ms).fade().scale(),
      _buildLinkButton("$appName (Android)", googlePlayUrl, context).animate(delay: (delay + 100).ms).fade().scale(),
    ];
    
    if (webUrl != null) {
      buttons.add(
        _buildLinkButton("$appName (Web)", webUrl, context).animate(delay: (delay + 200).ms).fade().scale(),
      );
    }
    
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: buttons,
    );
  }

  // URL Launcher Function
  Future<void> _launchURL(String urlString, BuildContext context) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      if (context.mounted) {
        final l10n = AppLocalizations.of(context)!;
        debugPrint(l10n.errorLinkFailed(urlString));
      } else {
        debugPrint("Error: Could not open link -> $urlString");
      }
    }
  }
}