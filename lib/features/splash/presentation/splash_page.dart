import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/theme/app_palette.dart';
import '../../../shared/widgets/backdrop_orb.dart';
import '../../../shared/widgets/pill_label.dart';
import '../../auth/presentation/auth_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  static const List<_OnboardingSlide> _slides = [
    _OnboardingSlide(
      icon: Icons.terrain_rounded,
      title: 'Ride4Kurdistan',
      description:
          'Adventure, culture, and eco-tourism for the Kurdistan Region in one clean mobile experience.',
      chips: ['Cycling', 'Hiking', 'Camping'],
    ),
    _OnboardingSlide(
      icon: Icons.explore_rounded,
      title: 'How To Use The App',
      description:
          'Browse routes, save places you love, explore quick actions, and keep your next outdoor trip organized in one place.',
      chips: ['Explore routes', 'Save highlights', 'Track plans'],
    ),
    _OnboardingSlide(
      icon: Icons.privacy_tip_rounded,
      title: 'Privacy And Safety',
      description:
          'We keep onboarding simple, explain what the app does, and help travelers start with more confidence around routes and local experiences.',
      chips: ['Privacy first', 'Guest access', 'Safer trips'],
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _handleNext() async {
    if (_currentPage == _slides.length - 1) {
      _goToAuth();
      return;
    }

    await _pageController.nextPage(
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );
  }

  void _goToAuth() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder<void>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const AuthPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentPage == _slides.length - 1;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF07130D), Color(0xFF10241B), Color(0xFF1B4332)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            const BackdropOrb(
              alignment: Alignment.topLeft,
              size: 240,
              color: Color(0x143E7A5F),
            ),
            const BackdropOrb(
              alignment: Alignment.bottomRight,
              size: 300,
              color: Color(0x1A2E6B52),
            ),
            const BackdropOrb(
              alignment: Alignment(0.65, -0.15),
              size: 180,
              color: Color(0x123A8A67),
            ),
            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Welcome',
                              style: GoogleFonts.manrope(
                                color: Colors.white.withValues(alpha: 0.78),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: _goToAuth,
                              child: Text(
                                'Skip',
                                style: GoogleFonts.manrope(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 640),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(34),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(28),
                                    decoration: BoxDecoration(
                                      color: AppPalette.cardSoft.withValues(
                                        alpha: 0.78,
                                      ),
                                      borderRadius: BorderRadius.circular(34),
                                      border: Border.all(
                                        color: AppPalette.line.withValues(
                                          alpha: 0.90,
                                        ),
                                      ),
                                    ),
                                    child: PageView.builder(
                                      controller: _pageController,
                                      itemCount: _slides.length,
                                      onPageChanged: (index) {
                                        setState(() => _currentPage = index);
                                      },
                                      itemBuilder: (context, index) {
                                        final item = _slides[index];
                                        return _SplashSlideCard(slide: item);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            _slides.length,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 220),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              height: 8,
                              width: _currentPage == index ? 28 : 8,
                              decoration: BoxDecoration(
                                color: _currentPage == index
                                    ? Colors.white
                                    : Colors.white.withValues(alpha: 0.28),
                                borderRadius: BorderRadius.circular(999),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'Slide ${_currentPage + 1} of ${_slides.length}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.manrope(
                            color: Colors.white.withValues(alpha: 0.88),
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: _currentPage == 0
                                    ? null
                                    : () {
                                        _pageController.previousPage(
                                          duration: const Duration(
                                            milliseconds: 280,
                                          ),
                                          curve: Curves.easeOutCubic,
                                        );
                                      },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  side: BorderSide(
                                    color: Colors.white.withValues(alpha: 0.22),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 18,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                ),
                                child: const Text('Back'),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              flex: 2,
                              child: FilledButton(
                                onPressed: _handleNext,
                                style: FilledButton.styleFrom(
                                  backgroundColor: AppPalette.moss,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 18,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                ),
                                child: Text(isLastPage ? 'Get Started' : 'Next'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SplashSlideCard extends StatelessWidget {
  const _SplashSlideCard({required this.slide});

  final _OnboardingSlide slide;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxHeight < 360;

        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: isCompact ? 72 : 88,
                  width: isCompact ? 72 : 88,
                  decoration: BoxDecoration(
                    color: AppPalette.moss,
                    borderRadius: BorderRadius.circular(isCompact ? 24 : 28),
                  ),
                  child: Icon(
                    slide.icon,
                    size: isCompact ? 34 : 42,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: isCompact ? 18 : 24),
                Text(
                  slide.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSerifDisplay(
                    color: Colors.white,
                    fontSize: isCompact ? 32 : 40,
                    height: 1.05,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  slide.description,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                    color: Colors.white.withValues(alpha: 0.80),
                    fontSize: isCompact ? 14 : 16,
                    height: 1.55,
                  ),
                ),
                SizedBox(height: isCompact ? 18 : 24),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: slide.chips.map(PillLabel.new).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _OnboardingSlide {
  const _OnboardingSlide({
    required this.icon,
    required this.title,
    required this.description,
    required this.chips,
  });

  final IconData icon;
  final String title;
  final String description;
  final List<String> chips;
}
