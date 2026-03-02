import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'Grut - Portfolio'**
  String get appTitle;

  /// Name displayed on homepage
  ///
  /// In en, this message translates to:
  /// **'Emre Oz'**
  String get name;

  /// Subtitle displayed below name
  ///
  /// In en, this message translates to:
  /// **'Software Developer.'**
  String get subtitle;

  /// Focus areas text
  ///
  /// In en, this message translates to:
  /// **'Flutter • Supabase • Offline-First • Optimization Specialist'**
  String get focus;

  /// About section text
  ///
  /// In en, this message translates to:
  /// **'High-performance Mobile Application Developer specializing in Flutter and Serverless Cloud Architectures. I don\'t just write code—I architect systems. My focus is on designing optimized architectures and systems that deliver production-grade applications on both Apple App Store and Google Play Store.'**
  String get about;

  /// Projects section title
  ///
  /// In en, this message translates to:
  /// **'PROJECTS'**
  String get projects;

  /// Hit Archery project title
  ///
  /// In en, this message translates to:
  /// **'Hit Archery'**
  String get hitArcheryTitle;

  /// Hit Archery project description
  ///
  /// In en, this message translates to:
  /// **'Complete training and performance tracking application for archers and coaches. Features offline-first architecture ensuring seamless experience even without internet connectivity. Real-time synchronization powered by Supabase Realtime enables instant data updates across devices. Separate responsive layouts optimized for mobile and web platforms provide native experiences on each device.'**
  String get hitArcheryDescription;

  /// Hit Archery tech stack
  ///
  /// In en, this message translates to:
  /// **'Flutter • Offline-First • Supabase Realtime • Google Sign-In • Apple Sign-In • Password Reset • STMP'**
  String get hitArcheryTechStack;

  /// Hit Archery Score project title
  ///
  /// In en, this message translates to:
  /// **'Hit Archery Score'**
  String get hitArcheryScoreTitle;

  /// Hit Archery Score project description
  ///
  /// In en, this message translates to:
  /// **'Professional archery competition management platform. Built on the same Supabase backend ecosystem as Hit Archery, enabling seamless data sharing and unified user authentication. Real-time competition updates, live score tracking, and elimination bracket management powered by Supabase Realtime.'**
  String get hitArcheryScoreDescription;

  /// Hit Archery Score tech stack
  ///
  /// In en, this message translates to:
  /// **'Flutter • Supabase Backend • Supabase Realtime • Google Sign-In • Apple Sign-In • Shared Ecosystem'**
  String get hitArcheryScoreTechStack;

  /// Neon Show project title
  ///
  /// In en, this message translates to:
  /// **'Neon Show'**
  String get neonShowTitle;

  /// Neon Show project description
  ///
  /// In en, this message translates to:
  /// **'Synchronized light show application for large-scale events, concerts, and stadiums. Implements Network Time Protocol (NTP) algorithm for precise synchronization across thousands of devices. Real-time color choreography synchronization ensures all participant screens display coordinated light patterns simultaneously, creating stunning visual experiences.'**
  String get neonShowDescription;

  /// Neon Show tech stack
  ///
  /// In en, this message translates to:
  /// **'Flutter • NTP Algorithm • Multi-Device Sync • Cloudflare Backend'**
  String get neonShowTechStack;

  /// Hosting Management project title
  ///
  /// In en, this message translates to:
  /// **'Hosting & SSL Management'**
  String get hostingManagementTitle;

  /// Hosting Management project subtitle
  ///
  /// In en, this message translates to:
  /// **'Client Project (Contract) | February 2026'**
  String get hostingManagementSubtitle;

  /// Hosting Management project description
  ///
  /// In en, this message translates to:
  /// **'Custom Flutter solution for a web hosting provider, integrating Application Programming Interfaces to automate domain management and Secure Sockets Layer certificate tracking. Leveraged Cloudflare\'s edge infrastructure to ensure secure and scalable data handling. Cross-platform application supporting Android, iOS, Web, Windows, macOS, and Linux.'**
  String get hostingManagementDescription;

  /// Hosting Management tech stack
  ///
  /// In en, this message translates to:
  /// **'Flutter • Cloudflare Workers • Cloudflare D1 • REST API • Multi-Platform'**
  String get hostingManagementTechStack;

  /// Links section title
  ///
  /// In en, this message translates to:
  /// **'LINKS'**
  String get links;

  /// Apps section title
  ///
  /// In en, this message translates to:
  /// **'APPS'**
  String get apps;

  /// GitHub link button text
  ///
  /// In en, this message translates to:
  /// **'GitHub'**
  String get github;

  /// LinkedIn link button text
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get linkedin;

  /// Hit Archery app name
  ///
  /// In en, this message translates to:
  /// **'Hit Archery'**
  String get hitArchery;

  /// Hit Archery Score app name
  ///
  /// In en, this message translates to:
  /// **'Hit Archery Score'**
  String get hitArcheryScore;

  /// Neon Show app name
  ///
  /// In en, this message translates to:
  /// **'Neon Show'**
  String get neonShow;

  /// App Store link button text
  ///
  /// In en, this message translates to:
  /// **'App Store'**
  String get appStore;

  /// Google Play link button text
  ///
  /// In en, this message translates to:
  /// **'Google Play'**
  String get googlePlay;

  /// YouTube link button text
  ///
  /// In en, this message translates to:
  /// **'Geoemrys (YouTube)'**
  String get youtube;

  /// GitHub link button text for projects
  ///
  /// In en, this message translates to:
  /// **'View on GitHub'**
  String get viewOnGitHub;

  /// Error message when link fails to open
  ///
  /// In en, this message translates to:
  /// **'Error: Could not open link -> {url}'**
  String errorLinkFailed(String url);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
