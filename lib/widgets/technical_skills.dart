import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/l10n/app_localizations.dart';

class TechnicalSkills extends StatelessWidget {
  const TechnicalSkills({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.technicalSkills,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2),
        ).animate(delay: 1300.ms).fade(duration: 400.ms),
        
        const SizedBox(height: 30),
        
        // Use Wrap for responsive grid
        Wrap(
          spacing: 24,
          runSpacing: 24,
          children: [
            _buildSkillColumn(
              title: l10n.mobileNative,
              icon: Icons.phone_android_rounded,
              skills: ['Flutter', 'Dart', 'Kotlin (Android Integration)', 'Java'],
              delay: 1400,
            ),
            _buildSkillColumn(
              title: l10n.backendCloud,
              icon: Icons.cloud_outlined,
              skills: ['Supabase', 'Cloudflare Workers', 'D1 SQL', 'REST APIs'],
              delay: 1500,
            ),
            _buildSkillColumn(
              title: l10n.engineeringPractice,
              icon: Icons.architecture_rounded,
              skills: ['Local-First Architecture', 'NTP Time Sync', 'Performance Optimization'],
              delay: 1600,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSkillColumn({
    required String title,
    required IconData icon,
    required List<String> skills,
    required int delay,
  }) {
    // For smaller screens, this will naturally wrap.
    // On larger screens, using IntrinsicWidth or specific widths helps form a grid.
    return SizedBox(
      width: 300, // Fixed width for nice grid behavior on Wrap
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B), // Slate 800
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF334155), width: 1), // Slate 700
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF60A5FA), size: 24), // Blue 400
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...skills.map((skill) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_outline, color: Color(0xFF475569), size: 18), // Slate 600
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        skill,
                        style: const TextStyle(fontSize: 15, color: Color(0xFFCBD5E1)), // Slate 300
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ).animate(delay: delay.ms).fade().slideY(begin: 0.1, end: 0),
    );
  }
}
