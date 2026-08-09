import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _launchURL(String urlString, BuildContext context) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      if (context.mounted) {
        final l10n = AppLocalizations.of(context)!;
        debugPrint(l10n.errorLinkFailed(urlString));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // Parse focus areas into tags
    final tags = l10n.focus.split(' • ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name
        Text(
          l10n.name,
          style: const TextStyle(
            fontSize: 56, 
            fontWeight: FontWeight.w900, 
            color: Colors.white, 
            letterSpacing: -2,
            height: 1.1,
          ),
        ).animate().fade(duration: 400.ms).slideX(begin: -0.1, end: 0),
        
        const SizedBox(height: 16),

        // Hero Badges (Tags)
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: tags.map((tag) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B), // Slate 800
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF334155), width: 1), // Slate 700
              ),
              child: Text(
                tag,
                style: const TextStyle(
                  fontSize: 14, 
                  fontWeight: FontWeight.w600, 
                  color: Color(0xFF94A3B8) // Slate 400
                ),
              ),
            );
          }).toList(),
        ).animate(delay: 200.ms).fade(duration: 400.ms).slideX(begin: -0.1, end: 0),
        
        const SizedBox(height: 24),
        
        // Shortened About Description
        Text(
          l10n.about,
          style: const TextStyle(
            fontSize: 18, 
            color: Color(0xFFCBD5E1), // Slate 300
            height: 1.6,
          ),
        ).animate(delay: 350.ms).fade(duration: 400.ms).slideX(begin: -0.1, end: 0),
        
        const SizedBox(height: 32),

        // Call to Action Buttons
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            // Primary Button
            ElevatedButton.icon(
              onPressed: () => _launchURL("resume.pdf", context), // Placeholder for PDF
              icon: const Icon(Icons.download_rounded, size: 20),
              label: Text(l10n.resume, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B82F6), // Blue 500
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
            ).animate(delay: 500.ms).fade().scale(),
            
            // Secondary Button - GitHub
            OutlinedButton.icon(
              onPressed: () => _launchURL("https://github.com/ozemre0", context),
              icon: const Icon(Icons.code_rounded, size: 20),
              label: Text(l10n.github, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Color(0xFF334155), width: 1.5), // Slate 700
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ).animate(delay: 600.ms).fade().scale(),

            // Secondary Button - LinkedIn
            OutlinedButton.icon(
              onPressed: () => _launchURL("https://www.linkedin.com/in/muhammet-emre-oz-4ab357283/", context),
              icon: const Icon(Icons.link_rounded, size: 20),
              label: Text(l10n.linkedin, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Color(0xFF334155), width: 1.5),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ).animate(delay: 700.ms).fade().scale(),
          ],
        ),
      ],
    );
  }
}
