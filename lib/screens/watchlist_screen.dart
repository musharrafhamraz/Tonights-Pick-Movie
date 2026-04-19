import 'package:flutter/material.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  int selectedTab = 0;

  final List<WatchlistItem> items = [
    WatchlistItem(
      title: 'The Golden Hour',
      type: 'Movie',
      duration: '2h 14m',
      description:
          'A photographer\'s journey through the sun-drenched landscapes of Tuscany, chasing the perfect light before it fades.',
      addedDate: 'Added Oct 12',
      buttonLabel: 'Play',
      imageUrl:
          'https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=600',
    ),
    WatchlistItem(
      title: 'Dune Shadows',
      type: 'Series',
      duration: 'S1 E3',
      description:
          'An intricate political drama set against the backdrop of a beautiful but unforgiving desert planet.',
      addedDate: 'Added Sep 28',
      buttonLabel: 'Resume',
      imageUrl:
          'https://images.unsplash.com/photo-1509773896068-7fd415d91e2e?w=600',
    ),
    WatchlistItem(
      title: 'The Art of the Brew',
      type: 'Doc',
      duration: '1h 45m',
      description:
          'A deep dive into the passionate subculture of artisanal coffee making and the communities it builds.',
      addedDate: 'Added Oct 05',
      buttonLabel: 'Play',
      imageUrl:
          'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=600',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 768;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF5EE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF5EE),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFFC2652A)),
          onPressed: () {},
        ),
        title: const Text(
          'Sahara',
          style: TextStyle(
            fontFamily: 'serif',
            fontStyle: FontStyle.italic,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFFC2652A),
            letterSpacing: -0.5,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Color(0xFFC2652A)),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 32 : 16,
                vertical: isDesktop ? 48 : 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Watchlist',
                    style: TextStyle(
                      fontFamily: 'serif',
                      fontSize: screenWidth > 1024 ? 60 : (isDesktop ? 48 : 36),
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF3A302A),
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 768),
                    child: Text(
                      'Curated moments waiting to unfold. A warm evening is just a play button away.',
                      style: TextStyle(
                        fontSize: isDesktop ? 20 : 18,
                        color: const Color(0xFF605850),
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildTabChip('All Saved', 0),
                        const SizedBox(width: 16),
                        _buildTabChip('Movies', 1),
                        const SizedBox(width: 16),
                        _buildTabChip('Series', 2),
                        const SizedBox(width: 16),
                        _buildTabChip('Documentaries', 3),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildGrid(isDesktop),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabChip(String label, int index) {
    final isSelected = selectedTab == index;
    return InkWell(
      onTap: () => setState(() => selectedTab = index),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFC2652A) : Colors.transparent,
          border: Border.all(
            color: isSelected
                ? const Color(0xFFC2652A)
                : const Color(0xFFD8D0C8),
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFFC2652A).withValues(alpha: 0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF605850),
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(bool isDesktop) {
    int crossAxisCount = 1;
    if (isDesktop) {
      crossAxisCount = 3;
    } else if (MediaQuery.of(context).size.width > 600) {
      crossAxisCount = 2;
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 0.75,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) => _buildWatchlistCard(items[index]),
    );
  }

  Widget _buildWatchlistCard(WatchlistItem item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFD8D0C8).withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3A302A).withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.network(
                    item.imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFFECE6DC),
                        child: const Icon(Icons.movie, size: 60),
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        const Color(0xFF3A302A).withValues(alpha: 0.8),
                      ],
                      stops: const [0.5, 1.0],
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF3A302A).withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.bookmark_remove,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          item.type,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF3A302A),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          item.duration,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF3A302A),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontFamily: 'serif',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3A302A),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Text(
                      item.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF605850),
                        height: 1.5,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: const Color(0xFFD8D0C8).withValues(alpha: 0.3),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.addedDate.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF78706A),
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.play_circle, size: 20),
                          label: Text(item.buttonLabel),
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFFC2652A),
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WatchlistItem {
  final String title;
  final String type;
  final String duration;
  final String description;
  final String addedDate;
  final String buttonLabel;
  final String imageUrl;

  WatchlistItem({
    required this.title,
    required this.type,
    required this.duration,
    required this.description,
    required this.addedDate,
    required this.buttonLabel,
    required this.imageUrl,
  });
}
