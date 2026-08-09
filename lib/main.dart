import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  double _textScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emre - Portfolio',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      home: const SelectionArea(child: HomePage()),
      builder: (context, child) {
        return Listener(
          onPointerSignal: (pointerSignal) {
            if (pointerSignal is PointerScrollEvent) {
              if (HardwareKeyboard.instance.isControlPressed) {
                setState(() {
                  // Scroll up (negative delta) = zoom in, Scroll down (positive delta) = zoom out
                  if (pointerSignal.scrollDelta.dy < 0) {
                    _textScale += 0.1;
                  } else {
                    _textScale -= 0.1;
                  }
                  // Clamp the scale between 0.5x and 3.0x
                  _textScale = _textScale.clamp(0.5, 3.0);
                });
              }
            }
          },
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(_textScale),
            ),
            child: child!,
          ),
        );
      },
    );
  }
}