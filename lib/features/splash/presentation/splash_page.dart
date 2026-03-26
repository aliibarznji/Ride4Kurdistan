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
  bool _showContent = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 120), () {
      if (mounted) {
        setState(() => _showContent = true);
      }
    });

    Future.delayed(const Duration(milliseconds: 2600), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder<void>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const AuthPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  children: [
                    const Spacer(),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 650),
                      opacity: _showContent ? 1 : 0,
                      child: AnimatedSlide(
                        duration: const Duration(milliseconds: 650),
                        offset:
                            _showContent ? Offset.zero : const Offset(0, 0.08),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 460),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(34),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 18,
                                  sigmaY: 18,
                                ),
                                child: Container(
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
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 86,
                                        width: 86,
                                        decoration: BoxDecoration(
                                          color: AppPalette.moss,
                                          borderRadius:
                                              BorderRadius.circular(28),
                                        ),
                                        child: const Icon(
                                          Icons.terrain_rounded,
                                          size: 42,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 22),
                                      Text(
                                        'Ride4Kurdistan',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.dmSerifDisplay(
                                          color: Colors.white,
                                          fontSize: 38,
                                          height: 1.05,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        'Adventure, culture, and eco-tourism for the Kurdistan Region in one clean mobile experience.',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.manrope(
                                          color: Colors.white.withValues(
                                            alpha: 0.80,
                                          ),
                                          fontSize: 15,
                                          height: 1.6,
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      const Wrap(
                                        alignment: WrapAlignment.center,
                                        spacing: 10,
                                        runSpacing: 10,
                                        children: [
                                          PillLabel('Cycling'),
                                          PillLabel('Hiking'),
                                          PillLabel('Camping'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        SizedBox(
                          width: 28,
                          height: 28,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.4,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white.withValues(alpha: 0.85),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'Loading routes and local highlights...',
                          style: GoogleFonts.manrope(
                            color: Colors.white.withValues(alpha: 0.72),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
