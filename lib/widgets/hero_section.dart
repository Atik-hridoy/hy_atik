import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        children: [
          // Mobile Layout: Text first, then image below
          isMobile
              ? Column(
                  children: [
                    _buildHeroContent(),
                    const SizedBox(height: 32),
                    _buildHeroImage(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: _buildHeroContent()),
                    const SizedBox(width: 32),
                    Expanded(child: _buildHeroImage()),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildHeroImage() {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          'assets/images/im1.jpg', // Use local asset image
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error, color: AppTheme.primaryColor);
          },
        ),
      ),
    );
  }
}

Widget _buildHeroContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: 250.0,
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            animatedTexts: [
              TypewriterAnimatedText('</I am Hridoy >'),
            ],
          ),
        ),
      ),
      const SizedBox(height: 8),
      SizedBox(
        width: 300,
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            animatedTexts: [
              TypewriterAnimatedText(
                  'A passionate App Developer & CSE Engineer crafting smooth digital experiences.'),
            ],
          ),
        ),
      ),
      const SizedBox(height: 10),
      const Text(
        'I build cross-platform apps with Flutter, Firebase, and Django. Passionate about clean UI, smart backend logic, and user-focused design. From AI music apps to trackers, I turn ideas into real products.',
        style: TextStyle(
          fontSize: 16,
          color: AppTheme.textSecondaryColor,
        ),
      ),
      const SizedBox(height: 32),
      Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Contact Me'),
          ),
          const SizedBox(width: 16),
          OutlinedButton(
            onPressed: () async {
              const url = 'assets/cv/mycv.pdf';
              final fullUrl = Uri.base.resolve(url).toString();
              if (await canLaunchUrl(Uri.parse(fullUrl))) {
                await launchUrl(Uri.parse(fullUrl));
              } else {
                throw 'Could not launch $fullUrl';
              }
            },
            child: const Text('Download CV'),
          ),
        ],
      ),
    ],
  );
}
