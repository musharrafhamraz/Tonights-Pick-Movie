import 'package:flutter/material.dart';
import 'screens/movie_discovery_screen.dart';
import 'screens/mood_selection_screen.dart';
import 'screens/tonights_pick_screen.dart';
import 'screens/watchlist_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sahara - Movie Discovery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC2652A),
          background: const Color(0xFFFAF5EE),
        ),
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
      routes: {
        '/mood': (context) => const MoodSelectionScreen(),
        '/explore': (context) => const MovieDiscoveryScreen(),
        '/tonights-pick': (context) => const TonightsPickScreen(),
        '/watchlist': (context) => const WatchlistScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 1;

  final List<Widget> _screens = [
    const MoodSelectionScreen(),
    const MovieDiscoveryScreen(),
    const WatchlistScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFAF5EE).withOpacity(0.9),
          border: const Border(
            top: BorderSide(color: Color(0xFFD8D0C8), width: 0.5),
          ),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.mood, 'Mood', 0),
                _buildNavItem(Icons.style, 'Explore', 1),
                _buildNavItem(Icons.bookmark_border, 'Watchlist', 2),
                _buildNavItem(Icons.person_outline, 'Profile', 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isActive = _currentIndex == index;
    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xFFC2652A).withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive
                  ? const Color(0xFFC2652A)
                  : const Color(0xFF9A9088),
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: isActive
                    ? const Color(0xFFC2652A)
                    : const Color(0xFF9A9088),
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
