// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Grut - Portfolio';

  @override
  String get name => 'Emre Oz';

  @override
  String get subtitle => 'Software Developer.';

  @override
  String get focus =>
      'Flutter • Supabase • Offline-First • Optimization Specialist';

  @override
  String get about =>
      'High-performance Mobile Application Developer specializing in Flutter and Serverless Cloud Architectures. I don\'t just write code—I architect systems. My focus is on designing optimized architectures and systems that deliver production-grade applications on both Apple App Store and Google Play Store.';

  @override
  String get projects => 'PROJECTS';

  @override
  String get hitArcheryTitle => 'Hit Archery';

  @override
  String get hitArcheryDescription =>
      'Complete training and performance tracking application for archers and coaches. Features offline-first architecture ensuring seamless experience even without internet connectivity. Real-time synchronization powered by Supabase Realtime enables instant data updates across devices. Separate responsive layouts optimized for mobile and web platforms provide native experiences on each device.';

  @override
  String get hitArcheryTechStack =>
      'Flutter • Offline-First • Supabase Realtime • Google Sign-In • Apple Sign-In • Password Reset • STMP';

  @override
  String get hitArcheryScoreTitle => 'Hit Archery Score';

  @override
  String get hitArcheryScoreDescription =>
      'Professional archery competition management platform. Built on the same Supabase backend ecosystem as Hit Archery, enabling seamless data sharing and unified user authentication. Real-time competition updates, live score tracking, and elimination bracket management powered by Supabase Realtime.';

  @override
  String get hitArcheryScoreTechStack =>
      'Flutter • Supabase Backend • Supabase Realtime • Google Sign-In • Apple Sign-In • Shared Ecosystem';

  @override
  String get neonShowTitle => 'Neon Show';

  @override
  String get neonShowDescription =>
      'Synchronized light show application for large-scale events, concerts, and stadiums. Implements Network Time Protocol (NTP) algorithm for precise synchronization across thousands of devices. Real-time color choreography synchronization ensures all participant screens display coordinated light patterns simultaneously, creating stunning visual experiences.';

  @override
  String get neonShowTechStack =>
      'Flutter • NTP Algorithm • Multi-Device Sync • Cloudflare Backend';

  @override
  String get hostingManagementTitle => 'Hosting & SSL Management';

  @override
  String get hostingManagementSubtitle =>
      'Client Project (Contract) | February 2026';

  @override
  String get hostingManagementDescription =>
      'Custom Flutter solution for a web hosting provider, integrating Application Programming Interfaces to automate domain management and Secure Sockets Layer certificate tracking. Leveraged Cloudflare\'s edge infrastructure to ensure secure and scalable data handling. Cross-platform application supporting Android, iOS, Web, Windows, macOS, and Linux.';

  @override
  String get hostingManagementTechStack =>
      'Flutter • Cloudflare Workers • Cloudflare D1 • REST API • Multi-Platform';

  @override
  String get links => 'LINKS';

  @override
  String get apps => 'APPS';

  @override
  String get github => 'GitHub';

  @override
  String get linkedin => 'LinkedIn';

  @override
  String get hitArchery => 'Hit Archery';

  @override
  String get hitArcheryScore => 'Hit Archery Score';

  @override
  String get neonShow => 'Neon Show';

  @override
  String get appStore => 'App Store';

  @override
  String get googlePlay => 'Google Play';

  @override
  String get youtube => 'Geoemrys (YouTube)';

  @override
  String get viewOnGitHub => 'View on GitHub';

  @override
  String errorLinkFailed(String url) {
    return 'Error: Could not open link -> $url';
  }
}
