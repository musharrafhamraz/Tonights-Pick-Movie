import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool darkMode = false;
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF5EE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF5EE),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF78706A)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'serif',
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Color(0xFFC2652A),
            letterSpacing: -0.5,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Color(0xFF78706A)),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 768),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    _buildUserHeader(),
                    const SizedBox(height: 48),
                    _buildStatsGrid(),
                    const SizedBox(height: 48),
                    _buildMoodHistory(),
                    const SizedBox(height: 48),
                    _buildPreferences(),
                    const SizedBox(height: 48),
                    _buildAccount(),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserHeader() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFF6F0E8), width: 4),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF3A302A).withValues(alpha: 0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=300',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFFECE6DC),
                      child: const Icon(Icons.person, size: 60),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFC2652A),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF3A302A).withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white, size: 14),
                  onPressed: () {},
                  padding: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Alex Thorne',
          style: TextStyle(
            fontFamily: 'serif',
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: Color(0xFF3A302A),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Curating your cinematic journey',
          style: TextStyle(fontSize: 18, color: Color(0xFF605850), height: 1.5),
        ),
      ],
    );
  }

  Widget _buildStatsGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 600;

        if (isDesktop) {
          return Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  Icons.movie_outlined,
                  '124',
                  'Movies Watched',
                  false,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatCard(
                  Icons.bookmark_border,
                  '42',
                  'Saved',
                  false,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatCard(
                  Icons.local_fire_department,
                  '5 Days',
                  'Mood Streak',
                  true,
                ),
              ),
            ],
          );
        }

        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    Icons.movie_outlined,
                    '124',
                    'Movies Watched',
                    false,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatCard(
                    Icons.bookmark_border,
                    '42',
                    'Saved',
                    false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: _buildStatCard(
                Icons.local_fire_department,
                '5 Days',
                'Mood Streak',
                true,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatCard(
    IconData icon,
    String value,
    String label,
    bool isHighlighted,
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isHighlighted
            ? const Color(0xFFFBE8D8)
            : const Color(0xFFF6F0E8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isHighlighted
              ? const Color(0xFFC2652A).withValues(alpha: 0.2)
              : const Color(0xFFD8D0C8).withValues(alpha: 0.3),
        ),
        boxShadow: isHighlighted
            ? [
                BoxShadow(
                  color: const Color(0xFFC2652A).withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFFC2652A), size: 32),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'serif',
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: isHighlighted
                  ? const Color(0xFF401A08)
                  : const Color(0xFF3A302A),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              color: isHighlighted
                  ? const Color(0xFF8A4518)
                  : const Color(0xFF605850),
              fontWeight: FontWeight.w500,
              letterSpacing: 1.5,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildMoodHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text(
                'Your Mood History',
                style: TextStyle(
                  fontFamily: 'serif',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3A302A),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'View All',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFC2652A),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
            return GridView.count(
              crossAxisCount: crossAxisCount,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.2,
              children: [
                _buildMoodCard(
                  Icons.auto_awesome,
                  'Inspiring',
                  'Today',
                  const Color(0xFF8C3C3C),
                ),
                _buildMoodCard(
                  Icons.storm,
                  'Thrilling',
                  'Yesterday',
                  const Color(0xFF78706A),
                ),
                _buildMoodCard(
                  Icons.self_improvement,
                  'Relaxing',
                  'Mon',
                  const Color(0xFFC2652A),
                ),
                _buildMoodCard(
                  Icons.sentiment_very_satisfied,
                  'Joyful',
                  'Sun',
                  const Color(0xFF8C3C3C),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildMoodCard(
    IconData icon,
    String mood,
    String date,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2ECE4),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFD8D0C8).withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: 8),
          Text(
            mood,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF3A302A),
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: const TextStyle(fontSize: 12, color: Color(0xFF605850)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPreferences() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Preferences',
          style: TextStyle(
            fontFamily: 'serif',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF3A302A),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF6F0E8),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFD8D0C8).withValues(alpha: 0.4),
            ),
          ),
          child: Column(
            children: [
              _buildPreferenceItem(
                Icons.dark_mode_outlined,
                'Dark Mode',
                null,
                Switch(
                  value: darkMode,
                  onChanged: (value) => setState(() => darkMode = value),
                  activeColor: const Color(0xFFC2652A),
                ),
              ),
              const Divider(height: 1, color: Color(0xFFD8D0C8)),
              _buildPreferenceItem(
                Icons.notifications_active_outlined,
                'Notifications',
                null,
                Switch(
                  value: notifications,
                  onChanged: (value) => setState(() => notifications = value),
                  activeColor: const Color(0xFFC2652A),
                ),
              ),
              const Divider(height: 1, color: Color(0xFFD8D0C8)),
              _buildPreferenceItem(
                Icons.subscriptions_outlined,
                'Streaming Services',
                'Manage connected platforms',
                const Icon(Icons.chevron_right, color: Color(0xFF9A9088)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPreferenceItem(
    IconData icon,
    String title,
    String? subtitle,
    Widget trailing,
  ) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFF2ECE4),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: const Color(0xFF605850), size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF3A302A),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF605850),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8),
            trailing,
          ],
        ),
      ),
    );
  }

  Widget _buildAccount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Account',
          style: TextStyle(
            fontFamily: 'serif',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF3A302A),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF6F0E8),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFD8D0C8).withValues(alpha: 0.4),
            ),
          ),
          child: Column(
            children: [
              _buildAccountItem(
                Icons.person_outline,
                'Edit Profile',
                const Color(0xFF605850),
              ),
              const Divider(height: 1, color: Color(0xFFD8D0C8)),
              _buildAccountItem(
                Icons.shield_outlined,
                'Privacy & Security',
                const Color(0xFF605850),
              ),
              const Divider(height: 1, color: Color(0xFFD8D0C8)),
              _buildAccountItem(
                Icons.logout,
                'Sign Out',
                const Color(0xFFC0392B),
                isDestructive: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAccountItem(
    IconData icon,
    String title,
    Color iconColor, {
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: isDestructive
                      ? const Color(0xFFC0392B)
                      : const Color(0xFF3A302A),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (!isDestructive) ...[
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right, color: Color(0xFF9A9088)),
            ],
          ],
        ),
      ),
    );
  }
}
