import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  // Helper method to open URLs
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width > 800
            ? 800
            : MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.blue.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            Text(
              'Let’s Connect!',
              style: GoogleFonts.notoSans(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            const SizedBox(height: 16),
            // Description
            Text(
              'I’m always open to discussing new projects, creative ideas, or opportunities to be part of your vision.',
              style: GoogleFonts.notoSans(
                fontSize: 16,
                color: Colors.blueGrey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            // Contact Information
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Email
                GestureDetector(
                  onTap: () {
                    _launchURL('mailto:atik.hridoy.00@gmail.com');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.email, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text(
                        'atik.hridoy.00@gmail.com',
                        style: GoogleFonts.notoSans(
                          fontSize: 16,
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Phone
                GestureDetector(
                  onTap: () {
                    _launchURL('tel:+8801333410106');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.phone, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text(
                        '+880 1333 410 106',
                        style: GoogleFonts.notoSans(
                          fontSize: 16,
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // WhatsApp
                GestureDetector(
                  onTap: () {
                    _launchURL(
                        'https://wa.me/8801333410106'); // WhatsApp link with phone number
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(FontAwesomeIcons.whatsapp,
                          color: Colors.green),
                      const SizedBox(width: 8),
                      Text(
                        'Chat on WhatsApp',
                        style: GoogleFonts.notoSans(
                          fontSize: 16,
                          color: Colors.green.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // Social Media Links
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // GitHub
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: IconButton(
                        icon: const FaIcon(FontAwesomeIcons.github),
                        color: Colors.blue.shade900,
                        iconSize: 32,
                        onPressed: () {
                          _launchURL('https://github.com/Atik-hridoy');
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    // LinkedIn
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: IconButton(
                        icon: const FaIcon(FontAwesomeIcons.linkedin),
                        color: Colors.blue.shade900,
                        iconSize: 32,
                        onPressed: () {
                          _launchURL(
                              'https://www.linkedin.com/in/atik-ahmed-ridoy-5678aa179/');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
