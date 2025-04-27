import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  final ScrollController scrollController;

  const Navbar({super.key, required this.scrollController});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool isScrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() {
      setState(() {
        isScrolled = widget.scrollController.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: isScrolled ? Colors.black : Colors.black.withOpacity(0.8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Text(
              'Atik />',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // Navigation Links
          if (isMobile)
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildAnimatedNavItem('Projects', 0),
                    const SizedBox(width: 16),
                    _buildAnimatedNavItem('Teach', 1),
                    const SizedBox(width: 16),
                    _buildAnimatedNavItem('Skills', 2),
                    const SizedBox(width: 16),
                    _buildAnimatedNavItem('Contact', 3),
                  ],
                ),
              ),
            )
          else
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildAnimatedNavItem('Projects', 0),
                  const SizedBox(width: 16),
                  _buildAnimatedNavItem('Teach', 1),
                  const SizedBox(width: 16),
                  _buildAnimatedNavItem('Skills', 2),
                  const SizedBox(width: 16),
                  _buildAnimatedNavItem('Contact', 3),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAnimatedNavItem(String title, int sectionIndex) {
    return GestureDetector(
      onTap: () {
        double offset = _getSectionOffset(sectionIndex);
        widget.scrollController.animateTo(
          offset,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      child: MouseRegion(
        onEnter: (_) => setState(() {}),
        onExit: (_) => setState(() {}),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.5),
                width: 2,
              ),
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  double _getSectionOffset(int sectionIndex) {
    const sectionHeights = {
      0: 600.0, // Projects section offset
      1: 1200.0, // Teach section offset
      2: 1800.0, // Skills section offset
      3: 2400.0, // Contact section offset
    };
    return sectionHeights[sectionIndex] ?? 0.0;
  }
}
