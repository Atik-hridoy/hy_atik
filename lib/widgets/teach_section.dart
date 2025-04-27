import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TeachSection extends StatelessWidget {
  const TeachSection({super.key});

  @override
  Widget build(BuildContext context) {
    final topics = [
      {
        'title': 'Firebase & Firestore',
        'description':
            'I use Firebase and Firestore to handle backend, auth, and real-time data with ease.',
        'icon': 'assets/icons/firebase.svg',
        'color': Colors.orange,
      },
      {
        'title': 'MySQL',
        'description':
            'I manage and structure databases using MySQL, writing clean and optimized queries.',
        'icon': 'assets/icons/database.svg',
        'color': Colors.blue,
      },
      {
        'title': 'REST API',
        'description':
            'I connect apps to servers using REST APIs to send, receive, and sync data smoothly.',
        'icon': 'assets/icons/rest-api.svg',
        'color': Colors.green,
      },
      {
        'title': 'Git & Version Control',
        'description':
            'I use Git and GitHub to track code changes and collaborate easily with teams.',
        'icon': 'assets/icons/github.svg',
        'color': const Color.fromARGB(255, 8, 8, 8),
      },
      {
        'title': 'Windows',
        'description':
            'Most of my work is done on Windows — I know my way around setups, configs, and debugging here.',
        'icon': 'assets/icons/windows.svg',
        'color': Colors.teal,
      },
      {
        'title': 'Linux',
        'description':
            'I’m comfortable working in Linux, especially for server-side work and command-line tasks.',
        'icon': 'assets/icons/ubuntu.svg',
        'color': Colors.red,
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
              'Teach I Used',
              style: GoogleFonts.notoSans(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            Column(
              children: topics.asMap().entries.map((entry) {
                final index = entry.key;
                final topic = entry.value;
                final isLeftAligned = index % 2 == 0;

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (isLeftAligned) ...[
                      // Timeline indicator on the left
                      _buildTimelineIndicator(topic, isLeftAligned),
                      const SizedBox(width: 16),
                      // Card in the middle
                      Expanded(child: _buildCard(topic)),
                    ] else ...[
                      // Card in the middle
                      Expanded(child: _buildCard(topic)),
                      const SizedBox(width: 16),
                      // Timeline indicator on the right
                      _buildTimelineIndicator(topic, isLeftAligned),
                    ],
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineIndicator(
      Map<String, dynamic> topic, bool isLeftAligned) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: topic['color'] as Color, // Border color
              width: 2,
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white, // Background color inside the border
            radius: 28,
            child: SvgPicture.asset(
              topic['icon'] as String, // Use SVG file from assets
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
          ),
        ),
        if (!isLeftAligned) // Add spacing for alignment
          const SizedBox(height: 8),
        Container(
          width: 2,
          height: 80,
          color: Colors.grey.withOpacity(0.3), // Transparent line
        ),
      ],
    );
  }

  Widget _buildCard(Map<String, dynamic> topic) {
    return Card(
      elevation: 4,
      color: (topic['color'] as Color)
          .withOpacity(0.1), // Transparent card background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              topic['title'] as String,
              style: GoogleFonts.notoSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              topic['description'] as String,
              style: GoogleFonts.notoSans(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
