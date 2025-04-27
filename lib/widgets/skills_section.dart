import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      {
        'name': 'FLUTTER',
        'icon': 'assets/l_icons/flutter.svg', // Path to SVG file
        'color': const Color(0xFF030677),
        'percentage': 0.85, // Skill percentage (85%)
      },
      {
        'name': 'DJANGO',
        'icon': 'assets/l_icons/django.svg', // Path to SVG file
        'color': const Color(0xFF48BBFA),
        'percentage': 0.75, // Skill percentage (75%)
      },
      {
        'name': 'PYTHON',
        'icon': 'assets/l_icons/python.svg', // Path to SVG file
        'color': const Color(0xFF7E76EF),
        'percentage': 0.90, // Skill percentage (90%)
      },
      {
        'name': 'HTML',
        'icon': 'assets/l_icons/html.svg', // Path to SVG file
        'color': const Color(0xFFE3D7CC),
        'percentage': 0.80, // Skill percentage (80%)
      },
      {
        'name': 'CSS',
        'icon': 'assets/l_icons/css.svg', // Path to SVG file
        'color': const Color(0xFF2758D2),
        'percentage': 0.70, // Skill percentage (70%)
      },
    ];

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width > 800
            ? 800
            : MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Skills',
              style: GoogleFonts.notoSans(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            // Icons aligned vertically with circular percentage indicators
            Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: skills.map((skill) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // Circular progress indicator
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: TweenAnimationBuilder<double>(
                            tween: Tween<double>(
                                begin: 0, end: skill['percentage'] as double),
                            duration: const Duration(seconds: 2),
                            builder: (context, value, child) {
                              return CircularProgressIndicator(
                                value: value,
                                strokeWidth: 8,
                                backgroundColor: Colors.grey[300],
                                color: skill['color'] as Color,
                              );
                            },
                          ),
                        ),
                        // Skill icon
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 28,
                          child: SvgPicture.asset(
                            skill['icon'] as String,
                            width: 32,
                            height: 32,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Skill name
                    Text(
                      skill['name'] as String,
                      style: GoogleFonts.notoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    // Percentage text
                    Text(
                      '${((skill['percentage'] as double) * 100).toInt()}%',
                      style: GoogleFonts.notoSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
