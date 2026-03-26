import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/theme/app_palette.dart';
import '../../../shared/widgets/backdrop_orb.dart';
import '../../../shared/widgets/feature_chip.dart';
import '../../../shared/widgets/mini_topography.dart';
import '../../dashboard/presentation/dashboard_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLogin = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _continue() {
    if (_emailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty) {
      _showMessage('Enter your email and password.');
      return;
    }

    if (!_isLogin && _nameController.text.trim().isEmpty) {
      _showMessage('Enter your full name to create the account.');
      return;
    }

    final fallbackName = _emailController.text.split('@').first;
    final userName = _isLogin ? fallbackName : _nameController.text.trim();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => DashboardPage(userName: userName)),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isWide = size.width >= 900;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF08150F), Color(0xFF11241C), Color(0xFF173527)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            const BackdropOrb(
              alignment: Alignment.topRight,
              size: 260,
              color: Color(0x163A8A67),
            ),
            const BackdropOrb(
              alignment: Alignment.bottomLeft,
              size: 240,
              color: Color(0x122E6B52),
            ),
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1180),
                    child: isWide
                        ? Row(
                            children: [
                              Expanded(child: _buildHeroPanel()),
                              const SizedBox(width: 26),
                              SizedBox(
                                width: 440,
                                child: _buildAuthCard(context),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              _buildHeroPanel(compact: true),
                              const SizedBox(height: 20),
                              _buildAuthCard(context),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroPanel({bool compact = false}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(34),
      child: Container(
        padding: EdgeInsets.all(compact ? 24 : 34),
        constraints: BoxConstraints(minHeight: compact ? 280 : 560),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF10241B), Color(0xFF1B4332)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(34),
          boxShadow: const [
            BoxShadow(
              color: Color(0x18000000),
              blurRadius: 30,
              offset: Offset(0, 18),
            ),
          ],
        ),
        child: Stack(
          children: [
            const Positioned(
              top: -40,
              right: -30,
              child: MiniTopography(size: 170, color: Color(0x1FFFFFFF)),
            ),
            const Positioned(
              bottom: -30,
              left: -20,
              child: MiniTopography(size: 150, color: Color(0x12F2E8CF)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.16),
                    ),
                  ),
                  child: Text(
                    'Explore the region with purpose',
                    style: GoogleFonts.manrope(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Find trails, camp sites, and scenic roads across Kurdistan.',
                  style: GoogleFonts.dmSerifDisplay(
                    color: Colors.white,
                    fontSize: compact ? 34 : 46,
                    height: 1.02,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'A cleaner starting point for outdoor adventure, route discovery, eco-points, and local experiences.',
                  style: GoogleFonts.manrope(
                    color: Colors.white.withValues(alpha: 0.78),
                    fontSize: 15,
                    height: 1.7,
                  ),
                ),
                const SizedBox(height: 28),
                if (!compact)
                  const Row(
                    children: [
                      Expanded(
                        child: _MetricCard(
                          label: 'Verified routes',
                          value: '120+',
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _MetricCard(
                          label: 'Adventure clubs',
                          value: '24',
                        ),
                      ),
                    ],
                  ),
                if (!compact) const SizedBox(height: 12),
                if (!compact)
                  const Row(
                    children: [
                      Expanded(
                        child: _MetricCard(label: 'Camping spots', value: '48'),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _MetricCard(
                          label: 'Eco rewards',
                          value: 'Daily',
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 28),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.18),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: AppPalette.moss,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.route_rounded,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          'From splash to dashboard, the app should feel like a real adventure brand.',
                          style: GoogleFonts.manrope(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthCard(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(34),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: AppPalette.card.withValues(alpha: 0.86),
            borderRadius: BorderRadius.circular(34),
            border: Border.all(color: AppPalette.line.withValues(alpha: 0.95)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 32,
                offset: Offset(0, 20),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _isLogin ? 'Welcome back' : 'Create your account',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              Text(
                _isLogin
                    ? 'Sign in to continue your next route.'
                    : 'Join the platform and start discovering routes.',
                style: GoogleFonts.manrope(
                  color: AppPalette.muted,
                  fontSize: 14,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 24),
              _buildSegmentedControl(),
              const SizedBox(height: 24),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 220),
                child: Column(
                  key: ValueKey<bool>(_isLogin),
                  children: [
                    if (!_isLogin) ...[
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: 'Full name',
                          prefixIcon: Icon(Icons.person_outline_rounded),
                        ),
                      ),
                      const SizedBox(height: 14),
                    ],
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email address',
                        prefixIcon: Icon(Icons.mail_outline_rounded),
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _continue,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppPalette.forest,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: Text(_isLogin ? 'Login' : 'Create account'),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const DashboardPage(userName: 'Guest'),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppPalette.forest,
                    side: const BorderSide(color: Color(0x332D6A4F)),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: const Text('Continue as guest'),
                ),
              ),
              const SizedBox(height: 22),
              const Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  FeatureChip(
                    icon: Icons.shield_outlined,
                    text: 'Safe trip tools',
                  ),
                  FeatureChip(
                    icon: Icons.map_outlined,
                    text: 'Verified routes',
                  ),
                  FeatureChip(icon: Icons.eco_outlined, text: 'Eco rewards'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSegmentedControl() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppPalette.cardSoft,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppPalette.line),
      ),
      child: Row(
        children: [
          Expanded(
            child: _SegmentButton(
              title: 'Login',
              isActive: _isLogin,
              onTap: () => setState(() => _isLogin = true),
            ),
          ),
          Expanded(
            child: _SegmentButton(
              title: 'Sign Up',
              isActive: !_isLogin,
              onTap: () => setState(() => _isLogin = false),
            ),
          ),
        ],
      ),
    );
  }
}

class _SegmentButton extends StatelessWidget {
  const _SegmentButton({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  final String title;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isActive ? AppPalette.forest : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isActive
              ? const [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 18,
                    offset: Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.manrope(
            color: isActive ? Colors.white : AppPalette.forest,
            fontWeight: FontWeight.w800,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: GoogleFonts.dmSerifDisplay(
              color: Colors.white,
              fontSize: 26,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: GoogleFonts.manrope(
              color: Colors.white.withValues(alpha: 0.76),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
