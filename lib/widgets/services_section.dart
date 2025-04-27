import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/theme/app_theme.dart';
import 'package:flutter_portfolio/widgets/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center the content
        children: [
          // Centered Title and Description
          const Center(
            child: SectionTitle(
              title: 'I have Done!',
              subtitle:
                  'I help individuals and businesses bring ideas to life with custom software solutions. Here’s how I can contribute to your success.',
              textAlign: TextAlign.center, // Center-align the text
            ),
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 3;
              if (constraints.maxWidth < 768) {
                crossAxisCount = 1;
              } else if (constraints.maxWidth < 1024) {
                crossAxisCount = 2;
              }

              return GridView.builder(
                shrinkWrap: true,
                itemCount: _services.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 1.4,
                ),
                itemBuilder: (context, index) {
                  final service = _services[index];

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.primaryColor.withOpacity(0.1),
                          AppTheme.primaryColor.withOpacity(0.2),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryColor.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(24),
                    child: ServiceCard(service: service),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextAlign textAlign; // Add textAlign parameter

  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.textAlign = TextAlign.start, // Default to left alignment
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: textAlign, // Apply text alignment
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
          textAlign: textAlign, // Apply text alignment
        ),
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final _Service service;

  const ServiceCard({super.key, required this.service});

  void _launchGitHub(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon with a gradient background
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                AppTheme.primaryColor.withOpacity(0.6),
                AppTheme.primaryColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Icon(service.icon, color: Colors.white, size: 32),
        ),
        const SizedBox(height: 16),
        // Title
        Text(
          service.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        // Subtitle
        Text(
          service.subTitle,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 230, 229, 187),
          ),
        ),
        const SizedBox(height: 8),
        // Description
        Expanded(
          child: Text(
            service.description,
            style: const TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 244, 246, 249),
            ),
          ),
        ),
        const SizedBox(height: 12),
        // GitHub Button
        InkWell(
          onTap: () => _launchGitHub(service.githubUrl),
          borderRadius: BorderRadius.circular(30),
          hoverColor: AppTheme.primaryColor.withOpacity(0.1),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: [
                  AppTheme.primaryColor.withOpacity(0.6),
                  AppTheme.primaryColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.code, size: 18, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'View on GitHub',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Service {
  final IconData icon;
  final String title;
  final String subTitle;
  final String description;
  final String githubUrl;

  const _Service({
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.githubUrl,
  });
}

const List<_Service> _services = [
  _Service(
    icon: Icons.phone_android,
    title: 'App Development',
    subTitle: 'Eco Tracker',
    description: 'A smart lifestyle app promoting eco-friendly habits...',
    githubUrl: 'https://github.com/Atik-hridoy/eco_track?tab=readme-ov-file',
  ),
  _Service(
    icon: Icons.memory,
    title: 'AI Integration',
    subTitle: 'Kontho',
    description: 'AI-powered music generation app from lyrics and tone.',
    githubUrl: 'https://github.com/yourusername/kontho',
  ),
  _Service(
    icon: Icons.bar_chart,
    title: 'Data Visualization',
    subTitle: 'Dynamic TeraBox',
    description: 'Cloud file manager with visual insights and sync.',
    githubUrl: 'https://github.com/Atik-hridoy/dynamic_terabox_app',
  ),
  _Service(
    icon: Icons.language,
    title: 'Web Solutions',
    subTitle: 'Fresh Mind',
    description: 'Django-based mental fitness and daily mood tracker.',
    githubUrl: 'https://github.com/Atik-hridoy/fresh_mind',
  ),
  _Service(
    icon: Icons.design_services,
    title: 'UI/UX Engineering',
    subTitle: 'Atik Portfolio',
    description: 'Smooth, user-centric portfolio UI/UX engineering.',
    githubUrl: 'https://github.com/yourusername/atikportfolio',
  ),
  _Service(
    icon: Icons.auto_fix_high,
    title: 'Automation Scripts',
    subTitle: 'Python Scripts',
    description: 'Python tools for automating tasks and logs.',
    githubUrl: 'https://github.com/yourusername/automation-scripts',
  ),
];
