import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/navbar.dart'; // Import Navbar
import 'package:flutter_portfolio/widgets/contact_section.dart';
import 'package:flutter_portfolio/widgets/footer.dart';
import 'package:flutter_portfolio/widgets/hero_section.dart';
import 'package:flutter_portfolio/widgets/teach_section.dart';
import 'package:flutter_portfolio/widgets/services_section.dart';
import 'package:flutter_portfolio/widgets/skills_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      body: Stack(
        children: [
          // Blurry gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF030677), // Dark blue
                  Color(0xFF48BBFA), // Light blue
                  Color(0xFF7E76EF), // Purple
                  Color(0xFFE3D7CC), // Beige
                  Color(0xFF2758D2), // Bright blue
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20), // Apply blur
              child: Container(
                color: Colors.black.withOpacity(0.1), // Optional dark overlay
              ),
            ),
          ),
          // Main content
          SingleChildScrollView(
            controller: scrollController,
            child: const Column(
              children: [
                SizedBox(height: 80), // Space for navbar
                HeroSection(),
                ServicesSection(),
                TeachSection(),
                SkillsSection(),
                ContactSection(),
                Footer(),
              ],
            ),
          ),
          // Navbar
          Navbar(
              scrollController: scrollController), // Pass the controller here
        ],
      ),
    );
  }
}
