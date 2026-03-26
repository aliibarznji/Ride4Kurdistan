import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/theme/app_palette.dart';
import '../../../shared/widgets/pill_label.dart';
import '../../auth/presentation/auth_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    final firstName = userName.trim().isEmpty
        ? 'Traveler'
        : userName.trim().split(' ').first;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF08150F), Color(0xFF10241B), Color(0xFF173527)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dashboard',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Ready for your next route, $firstName?',
                          style: GoogleFonts.manrope(
                            color: AppPalette.muted,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton.filledTonal(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const AuthPage()),
                      );
                    },
                    icon: const Icon(Icons.logout_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF10241B), Color(0xFF1E4D3C)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x18000000),
                      blurRadius: 28,
                      offset: Offset(0, 18),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.13),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(
                            Icons.explore_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 9,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            'Eco mode active',
                            style: GoogleFonts.manrope(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Text(
                      'Discover mountain roads, lakeside camps, and hiking trails with a simple starting dashboard.',
                      style: GoogleFonts.dmSerifDisplay(
                        color: Colors.white,
                        fontSize: 32,
                        height: 1.05,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'This is still lightweight, but it now looks and feels like the beginning of a real travel product.',
                      style: GoogleFonts.manrope(
                        color: Colors.white.withValues(alpha: 0.78),
                        height: 1.6,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 22),
                    const Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        PillLabel('Nearby routes'),
                        PillLabel('Camp sites'),
                        PillLabel('Travel clubs'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: _DashboardStatCard(
                      value: '18',
                      label: 'Routes saved',
                      icon: Icons.route_rounded,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _DashboardStatCard(
                      value: '240',
                      label: 'Eco points',
                      icon: Icons.eco_rounded,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _DashboardStatCard(
                      value: '7',
                      label: 'Trip logs',
                      icon: Icons.menu_book_rounded,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Quick Actions',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 14),
              const _QuickActionGrid(),
              const SizedBox(height: 24),
              Text(
                'Today''s Highlight',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 14),
              const _HighlightCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashboardStatCard extends StatelessWidget {
  const _DashboardStatCard({
    required this.value,
    required this.label,
    required this.icon,
  });

  final String value;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppPalette.card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppPalette.line),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 22,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppPalette.cardSoft,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: AppPalette.ink),
          ),
          const SizedBox(height: 14),
          Text(
            value,
            style: GoogleFonts.dmSerifDisplay(
              color: AppPalette.ink,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.manrope(
              color: AppPalette.muted,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionGrid extends StatelessWidget {
  const _QuickActionGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.15,
      children: const [
        _ActionCard(
          title: 'Explore Routes',
          subtitle: 'Cycling and hiking paths',
          icon: Icons.map_outlined,
          tone: Color(0xFF204534),
        ),
        _ActionCard(
          title: 'Trip Logbook',
          subtitle: 'Photos and route notes',
          icon: Icons.photo_library_outlined,
          tone: Color(0xFF1A3A2C),
        ),
        _ActionCard(
          title: 'Join Clubs',
          subtitle: 'Local group challenges',
          icon: Icons.groups_2_outlined,
          tone: Color(0xFF254B39),
        ),
        _ActionCard(
          title: 'Safety Center',
          subtitle: 'Tracking and emergency help',
          icon: Icons.health_and_safety_outlined,
          tone: Color(0xFF214435),
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.tone,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color tone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppPalette.card,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: AppPalette.line),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 22,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: tone,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: AppPalette.ink),
          ),
          const Spacer(),
          Text(
            title,
            style: GoogleFonts.manrope(
              color: AppPalette.ink,
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: GoogleFonts.manrope(
              color: AppPalette.muted,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _HighlightCard extends StatelessWidget {
  const _HighlightCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppPalette.card,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppPalette.line),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 24,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 92,
            height: 108,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1E4D3C), Color(0xFF2E6B52)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Icon(
              Icons.landscape_rounded,
              color: Colors.white,
              size: 38,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rawanduz Scenic Loop',
                  style: GoogleFonts.manrope(
                    color: AppPalette.ink,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'A simple featured route card for now, with room later for map data, difficulty, and live route status.',
                  style: GoogleFonts.manrope(
                    color: AppPalette.muted,
                    fontSize: 13,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _smallTag('Moderate'),
                    const SizedBox(width: 8),
                    _smallTag('42 km'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _smallTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppPalette.cardSoft,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppPalette.line),
      ),
      child: Text(
        text,
        style: GoogleFonts.manrope(
          color: AppPalette.ink,
          fontSize: 11,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
