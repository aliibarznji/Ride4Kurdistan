import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Ride4KurdistanApp());
}

class Ride4KurdistanApp extends StatelessWidget {
  const Ride4KurdistanApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppPalette.forest,
        brightness: Brightness.dark,
        primary: AppPalette.forest,
        secondary: AppPalette.moss,
        surface: AppPalette.surface,
      ),
      scaffoldBackgroundColor: AppPalette.background,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ride4Kurdistan',
      theme: baseTheme.copyWith(
        textTheme: GoogleFonts.manropeTextTheme(baseTheme.textTheme).copyWith(
          displayLarge: GoogleFonts.dmSerifDisplay(
            fontSize: 56,
            color: AppPalette.ink,
          ),
          displayMedium: GoogleFonts.dmSerifDisplay(
            fontSize: 40,
            color: AppPalette.ink,
          ),
          headlineLarge: GoogleFonts.dmSerifDisplay(
            fontSize: 34,
            color: AppPalette.ink,
          ),
          headlineMedium: GoogleFonts.dmSerifDisplay(
            fontSize: 28,
            color: AppPalette.ink,
          ),
          titleMedium: GoogleFonts.manrope(
            color: AppPalette.ink,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: GoogleFonts.manrope(color: AppPalette.ink),
          bodyMedium: GoogleFonts.manrope(color: AppPalette.ink),
          bodySmall: GoogleFonts.manrope(color: AppPalette.muted),
          labelLarge: GoogleFonts.manrope(
            color: AppPalette.ink,
            fontWeight: FontWeight.w700,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppPalette.cardSoft,
          hintStyle: const TextStyle(color: AppPalette.muted),
          prefixIconColor: AppPalette.muted,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppPalette.line),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppPalette.forest, width: 1.5),
          ),
        ),
      ),
      home: const SplashPage(),
    );
  }
}

class AppPalette {
  static const Color forest = Color(0xFF1E4D3C);
  static const Color pine = Color(0xFF16392C);
  static const Color moss = Color(0xFF2E6B52);
  static const Color gold = Color(0xFF8FB8A0);
  static const Color clay = Color(0xFF244B3A);
  static const Color sand = Color(0xFF2A5B46);
  static const Color surface = Color(0xFF10241B);
  static const Color background = Color(0xFF08150F);
  static const Color ink = Color(0xFFF3FBF5);
  static const Color muted = Color(0xFFB1C7BA);
  static const Color card = Color(0xFF122A20);
  static const Color cardSoft = Color(0xFF173527);
  static const Color line = Color(0xFF29503D);
}

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
            const _BackdropOrb(
              alignment: Alignment.topLeft,
              size: 240,
              color: Color(0x143E7A5F),
            ),
            const _BackdropOrb(
              alignment: Alignment.bottomRight,
              size: 300,
              color: Color(0x1A2E6B52),
            ),
            const _BackdropOrb(
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
                        offset: _showContent
                            ? Offset.zero
                            : const Offset(0, 0.08),
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
                                          borderRadius: BorderRadius.circular(
                                            28,
                                          ),
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
                                      Wrap(
                                        alignment: WrapAlignment.center,
                                        spacing: 10,
                                        runSpacing: 10,
                                        children: const [
                                          _PillLabel('Cycling'),
                                          _PillLabel('Hiking'),
                                          _PillLabel('Camping'),
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
            const _BackdropOrb(
              alignment: Alignment.topRight,
              size: 260,
              color: Color(0x163A8A67),
            ),
            const _BackdropOrb(
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
              child: _MiniTopography(size: 170, color: Color(0x1FFFFFFF)),
            ),
            const Positioned(
              bottom: -30,
              left: -20,
              child: _MiniTopography(size: 150, color: Color(0x12F2E8CF)),
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
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  _FeatureChip(
                    icon: Icons.shield_outlined,
                    text: 'Safe trip tools',
                  ),
                  _FeatureChip(
                    icon: Icons.map_outlined,
                    text: 'Verified routes',
                  ),
                  _FeatureChip(icon: Icons.eco_outlined, text: 'Eco rewards'),
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
                        _PillLabel('Nearby routes'),
                        _PillLabel('Camp sites'),
                        _PillLabel('Travel clubs'),
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
                'Today\'s Highlight',
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

class _FeatureChip extends StatelessWidget {
  const _FeatureChip({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppPalette.cardSoft,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppPalette.line),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppPalette.ink),
          const SizedBox(width: 8),
          Text(
            text,
            style: GoogleFonts.manrope(
              color: AppPalette.ink,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _PillLabel extends StatelessWidget {
  const _PillLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
      ),
      child: Text(
        text,
        style: GoogleFonts.manrope(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _BackdropOrb extends StatelessWidget {
  const _BackdropOrb({
    required this.alignment,
    required this.size,
    required this.color,
  });

  final Alignment alignment;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}

class _MiniTopography extends StatelessWidget {
  const _MiniTopography({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          for (final scale in [1.0, 0.75, 0.5])
            Align(
              child: Container(
                width: size * scale,
                height: size * scale,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: color),
                ),
              ),
            ),
        ],
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
