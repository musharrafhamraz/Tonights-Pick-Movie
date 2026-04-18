import 'package:flutter/material.dart';

class ContentDetailScreen extends StatelessWidget {
  final String title;
  final String imageUrl;

  const ContentDetailScreen({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 768;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF5EE),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFFFAF5EE),
            elevation: 0,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF78706A)),
              onPressed: () => Navigator.pop(context),
            ),
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
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert, color: Color(0xFF78706A)),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeroImage(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 48 : 24,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1280),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Transform.translate(
                          offset: const Offset(0, -64),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildMetadata(),
                              const SizedBox(height: 16),
                              _buildTitle(),
                              const SizedBox(height: 32),
                              _buildGenreTags(),
                              const SizedBox(height: 32),
                              _buildActionButtons(),
                              const SizedBox(height: 48),
                              _buildSynopsis(),
                              const SizedBox(height: 48),
                              _buildCastAndCrew(),
                              const SizedBox(height: 64),
                              _buildDetailsCard(),
                              const SizedBox(height: 48),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroImage() {
    return SizedBox(
      height: 442,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
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
                  Colors.transparent,
                  const Color(0xFFFAF5EE).withOpacity(0.2),
                  const Color(0xFFFAF5EE),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetadata() {
    return Wrap(
      spacing: 12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Text(
          '2024',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF78706A),
            letterSpacing: 0.5,
          ),
        ),
        Container(
          width: 4,
          height: 4,
          decoration: const BoxDecoration(
            color: Color(0xFFD8D0C8),
            shape: BoxShape.circle,
          ),
        ),
        const Text(
          '2h 14m',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF78706A),
            letterSpacing: 0.5,
          ),
        ),
        Container(
          width: 4,
          height: 4,
          decoration: const BoxDecoration(
            color: Color(0xFFD8D0C8),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFD8D0C8)),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            'PG-13',
            style: TextStyle(
              fontSize: 11,
              color: Color(0xFF78706A),
              letterSpacing: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return const Text(
      'The Golden Meridian',
      style: TextStyle(
        fontFamily: 'serif',
        fontSize: 56,
        fontWeight: FontWeight.w500,
        color: Color(0xFF3A302A),
        height: 1.1,
        letterSpacing: -0.5,
      ),
    );
  }

  Widget _buildGenreTags() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildGenreChip('Drama'),
        _buildGenreChip('Cinematic'),
        _buildGenreChip('Period'),
      ],
    );
  }

  Widget _buildGenreChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F0E8),
        border: Border.all(color: const Color(0xFFD8D0C8).withOpacity(0.5)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF605850),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC2652A),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 1,
            ),
            icon: const Icon(Icons.play_arrow, size: 24),
            label: const Text(
              'Watch Trailer',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF3A302A),
              side: const BorderSide(color: Color(0xFFD8D0C8)),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.bookmark_add_outlined, size: 20),
            label: const Text(
              'Save to Watchlist',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSynopsis() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 768),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFD8D0C8), width: 0.5),
              ),
            ),
            child: const Text(
              'Synopsis',
              style: TextStyle(
                fontFamily: 'serif',
                fontSize: 24,
                color: Color(0xFF3A302A),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Set against the backdrop of a declining empire, a stoic cartographer is tasked with mapping a territory that exists only in myth. As he delves deeper into the desert dunes, the lines between reality and mirage blur, leading to a profound discovery about the nature of memory and time itself.',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF605850),
              fontWeight: FontWeight.w300,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCastAndCrew() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFFD8D0C8), width: 0.5),
            ),
          ),
          child: const Text(
            'Cast & Crew',
            style: TextStyle(
              fontFamily: 'serif',
              fontSize: 24,
              color: Color(0xFF3A302A),
            ),
          ),
        ),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = 2;
            if (constraints.maxWidth > 1024) {
              crossAxisCount = 5;
            } else if (constraints.maxWidth > 768) {
              crossAxisCount = 4;
            } else if (constraints.maxWidth > 480) {
              crossAxisCount = 3;
            }

            return GridView.count(
              crossAxisCount: crossAxisCount,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              childAspectRatio: 0.65,
              children: [
                _buildCastMember(
                  'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400',
                  'Elias Thorne',
                  'The Cartographer',
                  false,
                ),
                _buildCastMember(
                  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400',
                  'Amara Vance',
                  'The Guide',
                  false,
                ),
                _buildCastMember(
                  'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
                  'Silas Vance',
                  'The Merchant',
                  false,
                ),
                _buildCastMember('', 'Julian Reed', 'Director', true),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildCastMember(
    String imageUrl,
    String name,
    String role,
    bool isDirector,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: isDirector
                  ? const Color(0xFFF6F0E8)
                  : const Color(0xFFE6E0D6),
              borderRadius: BorderRadius.circular(12),
              border: isDirector
                  ? Border.all(color: const Color(0xFFD8D0C8).withOpacity(0.3))
                  : null,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: isDirector
                  ? const Center(
                      child: Icon(
                        Icons.movie_outlined,
                        size: 48,
                        color: Color(0xFF9A9088),
                      ),
                    )
                  : Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(color: const Color(0xFFE6E0D6));
                      },
                    ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          name,
          style: const TextStyle(
            fontFamily: 'serif',
            fontSize: 18,
            color: Color(0xFF3A302A),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          role,
          style: TextStyle(
            fontSize: 14,
            color: isDirector
                ? const Color(0xFFC2652A)
                : const Color(0xFF78706A),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F0E8).withOpacity(0.6),
        border: Border.all(color: const Color(0xFFD8D0C8).withOpacity(0.4)),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 16,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 768) {
            return Row(
              children: [
                Expanded(
                  child: _buildDetailItem(
                    'Original Audio',
                    'English (Dolby Atmos)',
                  ),
                ),
                Expanded(
                  child: _buildDetailItem(
                    'Subtitles',
                    'English, Spanish, French, Arabic',
                  ),
                ),
                Expanded(
                  child: _buildDetailItem(
                    'Production',
                    'Mirage Studios, Aether Films',
                  ),
                ),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailItem('Original Audio', 'English (Dolby Atmos)'),
                const SizedBox(height: 24),
                _buildDetailItem(
                  'Subtitles',
                  'English, Spanish, French, Arabic',
                ),
                const SizedBox(height: 24),
                _buildDetailItem('Production', 'Mirage Studios, Aether Films'),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF78706A),
            letterSpacing: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF3A302A),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
