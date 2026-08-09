import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String description;
  final String techStack;
  final List<String>? imagePaths;
  final String? youtubeUrl;
  final String? appStoreUrl;
  final String? googlePlayUrl;
  final String? webUrl;
  final String? sourceUrl;

  const ProjectCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.description,
    required this.techStack,
    this.imagePaths,
    this.youtubeUrl,
    this.appStoreUrl,
    this.googlePlayUrl,
    this.webUrl,
    this.sourceUrl,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  int _currentPage = 0;
  final PageController _pageController = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.imagePaths != null && widget.imagePaths!.length > 1) {
      _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
        if (_currentPage < widget.imagePaths!.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        
        if (_pageController.hasClients) {
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

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
    final tags = widget.techStack.split(' • ');

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B), // Slate 800 (Dark Mode Card)
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF334155), width: 1), // Slate 700
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header (Image / Placeholder)
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: widget.imagePaths != null && widget.imagePaths!.isNotEmpty
                ? Container(
                    height: 200, // Reduced height
                    color: const Color(0xFF0F172A), // Darker background behind the image for contain fit
                    child: Stack(
                      children: [
                        PageView.builder(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemCount: widget.imagePaths!.length,
                          itemBuilder: (context, index) {
                            final path = widget.imagePaths![index];
                            if (path.startsWith('http')) {
                              return Image.network(path, fit: BoxFit.contain, width: double.infinity);
                            } else {
                              return Image.asset(path, fit: BoxFit.contain, width: double.infinity);
                            }
                          },
                        ),
                        if (widget.imagePaths!.length > 1)
                          Positioned(
                            bottom: 12,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                widget.imagePaths!.length,
                                (index) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  height: 8,
                                  width: _currentPage == index ? 24 : 8,
                                  decoration: BoxDecoration(
                                    color: _currentPage == index ? const Color(0xFF60A5FA) : Colors.white.withValues(alpha: 0.5),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 2. Title and Subtitle
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                if (widget.subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    widget.subtitle!,
                    style: const TextStyle(fontSize: 14, color: Color(0xFF94A3B8), fontStyle: FontStyle.italic), // Slate 400
                  ),
                ],
                
                const SizedBox(height: 16),
                
                // 3. Tech Stack Badges
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: tags.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6).withValues(alpha: 0.1), // Blue tinted
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: const Color(0xFF3B82F6).withValues(alpha: 0.3), width: 1),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF60A5FA)), // Blue 400
                      ),
                    );
                  }).toList(),
                ),
                
                const SizedBox(height: 16),
                
                // 4. Summary Text (Max 3 lines)
                Text(
                  widget.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 15, color: Color(0xFFCBD5E1), height: 1.5), // Slate 300
                ),
                
                const SizedBox(height: 24),
                
                // 5. Link / Action Bar
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    if (widget.youtubeUrl != null)
                      _buildActionLink(
                        icon: Icons.play_circle_fill_rounded, 
                        label: 'YouTube', 
                        url: widget.youtubeUrl!, 
                        context: context,
                        primary: true,
                      ),
                    if (widget.appStoreUrl != null)
                      _buildActionLink(
                        icon: Icons.apple_rounded, 
                        label: 'App Store', 
                        url: widget.appStoreUrl!, 
                        context: context,
                      ),
                    if (widget.googlePlayUrl != null)
                      _buildActionLink(
                        icon: Icons.android_rounded, 
                        label: 'Google Play', 
                        url: widget.googlePlayUrl!, 
                        context: context,
                      ),
                    if (widget.webUrl != null)
                      _buildActionLink(
                        icon: Icons.language_rounded, 
                        label: 'Web', 
                        url: widget.webUrl!, 
                        context: context,
                      ),
                    if (widget.sourceUrl != null)
                      _buildActionLink(
                        icon: Icons.code_rounded, 
                        label: l10n.sourceCode, 
                        url: widget.sourceUrl!, 
                        context: context,
                      ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }



  Widget _buildActionLink({
    required IconData icon, 
    required String label, 
    required String url, 
    required BuildContext context,
    bool primary = false,
  }) {
    return TextButton.icon(
      onPressed: () => _launchURL(url, context),
      icon: Icon(icon, size: 18),
      label: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      style: TextButton.styleFrom(
        foregroundColor: primary ? const Color(0xFF60A5FA) : const Color(0xFF94A3B8), // Blue 400 vs Slate 400
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        backgroundColor: primary ? const Color(0xFF3B82F6).withValues(alpha: 0.1) : Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
