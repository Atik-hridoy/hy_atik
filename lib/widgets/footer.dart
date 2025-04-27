import 'package:flutter/material.dart';
import 'package:flutter_portfolio/theme/app_theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, // Make the footer background transparent
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: const Text(
        '© 2024 Atik Ahmed Ridoy. All rights reserved.',
        style: TextStyle(
          fontSize: 14,
          color: AppTheme.textSecondaryColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
