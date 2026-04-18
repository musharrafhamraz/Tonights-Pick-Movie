import 'package:flutter/material.dart';
import 'content_detail_screen.dart';
import 'tonights_pick_screen.dart';

class MovieDiscoveryScreen extends StatefulWidget {
  const MovieDiscoveryScreen({super.key});

  @override
  State<MovieDiscoveryScreen> createState() => _MovieDiscoveryScreenState();
}

class _MovieDiscoveryScreenState extends State<MovieDiscoveryScreen> {
  final List<Movie> movies = [
    Movie(
      title: 'Dune: Part One',
      year: '2021',
      rating: 8.0,
      matchPercentage: 94,
      genres: 'Sci-Fi, Adventure',
      description:
          'A noble family becomes embroiled in a war for control over the galaxy\'s most valuable asset while its heir becomes troubled by visions of a dark future.',
      imageUrl:
          'https://images.unsplash.com/photo-1509773896068-7fd415d91e2e?w=800',
    ),
    Movie(
      title: 'Inception',
      year: '2010',
      rating: 8.8,
      matchPercentage: 92,
      genres: 'Sci-Fi, Thriller',
      description:
          'A thief who steals corporate secrets through dream-sharing technology is given the inverse task of planting an idea.',
      imageUrl:
          'https://images.unsplash.com/photo-1478720568477-152d9b164e26?w=800',
    ),
  ];

  int currentIndex = 0;

  void _onSwipeLeft() {
    if (currentIndex < movies.length - 1) {
      setState(() => currentIndex++);
    }
  }

  void _onSwipeRight() {
    if (currentIndex < movies.length - 1) {
      setState(() => currentIndex++);
    }
  }

  @override
  Widget build(BuildContext context) {
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
            fontWeight: FontWeight.bold,
            color: Color(0xFFC2652A),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFFC2652A)),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
              ),
            ),
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Expanded(child: _buildCardStack()),
            _buildActionButtons(),
            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TonightsPickScreen()),
          );
        },
        backgroundColor: const Color(0xFFC2652A),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.star),
        label: const Text('Tonight\'s Pick'),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: const Color(0xFFFAF5EE),
      child: Column(
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Evening, Alex',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3A302A),
                  ),
                ),
                const Text(
                  'Finding your vibe',
                  style: TextStyle(fontSize: 14, color: Color(0xFF605850)),
                ),
              ],
            ),
          ),
          const Divider(color: Color(0xFFD8D0C8)),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              children: [
                _buildDrawerItem(Icons.star, 'Tonight\'s Pick', true),
                _buildDrawerItem(Icons.quiz, 'Quiz', false),
                _buildDrawerItem(Icons.category, 'Categories', false),
                _buildDrawerItem(Icons.history, 'History', false),
                _buildDrawerItem(Icons.settings, 'Settings', false),
                _buildDrawerItem(Icons.help_outline, 'Support', false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String label, bool isSpecial) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSpecial ? const Color(0xFFC2652A) : const Color(0xFF605850),
      ),
      title: Text(
        label,
        style: TextStyle(
          color: isSpecial ? const Color(0xFFC2652A) : const Color(0xFF605850),
          fontWeight: isSpecial ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
      onTap: () {
        if (label == 'Tonight\'s Pick') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TonightsPickScreen()),
          );
        }
      },
      hoverColor: const Color(0xFFC2652A).withOpacity(0.05),
    );
  }

  Widget _buildCardStack() {
    if (currentIndex >= movies.length) {
      return const Center(child: Text('No more movies!'));
    }

    return Center(
      child: SizedBox(
        width: 340,
        height: 500,
        child: Stack(
          children: [
            if (currentIndex + 1 < movies.length)
              Positioned.fill(
                child: Transform.scale(
                  scale: 0.95,
                  child: Transform.translate(
                    offset: const Offset(0, 16),
                    child: Opacity(
                      opacity: 0.5,
                      child: _buildMovieCard(movies[currentIndex + 1], false),
                    ),
                  ),
                ),
              ),
            Positioned.fill(child: _buildMovieCard(movies[currentIndex], true)),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieCard(Movie movie, bool isActive) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContentDetailScreen(
              title: movie.title,
              imageUrl: movie.imageUrl,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 30,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                movie.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFECE6DC),
                    child: const Icon(Icons.movie, size: 80),
                  );
                },
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.9),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
              Positioned(
                left: 32,
                right: 32,
                bottom: 32,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFC2652A).withOpacity(0.9),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'MATCH ${movie.matchPercentage}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          movie.year,
                          style: const TextStyle(
                            color: Color(0xFFF2ECE4),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movie.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xFFC2652A),
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          movie.rating.toString(),
                          style: const TextStyle(
                            color: Color(0xFFF2ECE4),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '•',
                          style: TextStyle(color: Color(0xFF9A9088)),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            movie.genres,
                            style: const TextStyle(
                              color: Color(0xFF9A9088),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (isActive) ...[
                      const SizedBox(height: 12),
                      Text(
                        movie.description,
                        style: const TextStyle(
                          color: Color(0xFFD8D0C8),
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          height: 1.5,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildActionButton(
            icon: Icons.close,
            size: 64,
            color: const Color(0xFFECE6DC),
            iconColor: const Color(0xFF605850),
            onPressed: _onSwipeLeft,
          ),
          const SizedBox(width: 32),
          _buildActionButton(
            icon: Icons.undo,
            size: 56,
            color: const Color(0xFFE6E0D6),
            iconColor: const Color(0xFF605850),
            onPressed: () {},
          ),
          const SizedBox(width: 32),
          _buildActionButton(
            icon: Icons.favorite,
            size: 64,
            color: const Color(0xFFECE6DC),
            iconColor: const Color(0xFF605850),
            onPressed: _onSwipeRight,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required double size,
    required Color color,
    required Color iconColor,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: color,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          child: Icon(icon, size: size * 0.45, color: iconColor),
        ),
      ),
    );
  }
}

class Movie {
  final String title;
  final String year;
  final double rating;
  final int matchPercentage;
  final String genres;
  final String description;
  final String imageUrl;

  Movie({
    required this.title,
    required this.year,
    required this.rating,
    required this.matchPercentage,
    required this.genres,
    required this.description,
    required this.imageUrl,
  });
}
