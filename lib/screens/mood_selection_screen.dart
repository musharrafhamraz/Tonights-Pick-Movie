import 'package:flutter/material.dart';

class MoodSelectionScreen extends StatelessWidget {
  const MoodSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 768;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF5EE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF5EE),
        elevation: 0,
        title: const Text(
          'Sahara',
          style: TextStyle(
            fontFamily: 'serif',
            fontStyle: FontStyle.italic,
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Color(0xFFC2652A),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFFC2652A)),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 896),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: isDesktop ? 96 : 48,
              ),
              child: Column(
                children: [
                  Text(
                    'How are you feeling?',
                    style: TextStyle(
                      fontFamily: 'serif',
                      fontSize: isDesktop ? 72 : 48,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF3A302A),
                      height: 1.1,
                      letterSpacing: -1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Select a mood to guide your next cinematic journey. Let your current state of mind be the compass.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF605850),
                        fontWeight: FontWeight.w300,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 64),
                  _buildBentoGrid(isDesktop),
                  const SizedBox(height: 64),
                  const Text(
                    'Can\'t decide? Let us guide you.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF605850)),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC2652A),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 1,
                    ),
                    label: const Text(
                      'Take a Quiz',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                      ),
                    ),
                    icon: const Icon(Icons.arrow_forward, size: 20),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBentoGrid(bool isDesktop) {
    final gap = isDesktop ? 24.0 : 16.0;

    return Column(
      children: [
        // Row 1: Funny (full width, 2 columns)
        SizedBox(height: isDesktop ? 256 : 180, child: _buildFunnyCard()),
        SizedBox(height: gap),

        // Row 2: Mind-Bending + Comforting (1 column each)
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _buildMindBendingCard()),
              SizedBox(width: gap),
              Expanded(child: _buildComfortingCard()),
            ],
          ),
        ),
        SizedBox(height: gap),

        // Row 3: Thrilling + Short (1 column each)
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _buildThrillingCard()),
              SizedBox(width: gap),
              Expanded(child: _buildShortCard()),
            ],
          ),
        ),
        SizedBox(height: gap),

        // Row 4: Inspiring (full width, 2 columns)
        SizedBox(
          height: isDesktop ? 256 : 180,
          child: _buildInspiringCard(isDesktop),
        ),
      ],
    );
  }

  Widget _buildFunnyCard() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1511632765486-a01980e01a18?w=800',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(color: const Color(0xFFFBE8D8));
                },
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 24,
                bottom: 24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.white.withOpacity(0.8),
                      size: 24,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Funny',
                      style: TextStyle(
                        fontFamily: 'serif',
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Lighthearted & uplifting',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMindBendingCard() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF6F0E8),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFD8D0C8).withOpacity(0.5)),
          ),
          child: const Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.psychology, color: Color(0xFFC2652A), size: 24),
                SizedBox(height: 8),
                Text(
                  'Mind-Bending',
                  style: TextStyle(
                    fontFamily: 'serif',
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF3A302A),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildComfortingCard() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1513694203232-719a280e022f?w=600',
                  fit: BoxFit.cover,
                  opacity: const AlwaysStoppedAnimation(0.6),
                  errorBuilder: (context, error, stackTrace) {
                    return Container(color: const Color(0xFFECE6DC));
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFFECE6DC).withOpacity(0.5),
                        const Color(0xFFECE6DC),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  left: 24,
                  bottom: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.favorite, color: Color(0xFF8C3C3C), size: 24),
                      SizedBox(height: 8),
                      Text(
                        'Comforting',
                        style: TextStyle(
                          fontFamily: 'serif',
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF3A302A),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildThrillingCard() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF3A302A),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.local_fire_department,
                  color: Color(0xFFFBE8D8),
                  size: 24,
                ),
                SizedBox(height: 8),
                Text(
                  'Thrilling',
                  style: TextStyle(
                    fontFamily: 'serif',
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFAF5EE),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShortCard() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFAF5EE),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFD8D0C8)),
          ),
          child: const Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.timer_outlined, color: Color(0xFF605850), size: 24),
                SizedBox(height: 8),
                Text(
                  'Short',
                  style: TextStyle(
                    fontFamily: 'serif',
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF3A302A),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInspiringCard(bool isDesktop) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1509773896068-7fd415d91e2e?w=800',
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(0.4),
                errorBuilder: (context, error, stackTrace) {
                  return Container(color: const Color(0xFFE08850));
                },
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFFE08850).withOpacity(0.9),
                      const Color(0xFFE08850),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 24,
                bottom: 24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.wb_sunny,
                      color: Color(0xFF401A08),
                      size: 24,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Inspiring',
                      style: TextStyle(
                        fontFamily: 'serif',
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF401A08),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Stories of triumph',
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xFF401A08).withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
