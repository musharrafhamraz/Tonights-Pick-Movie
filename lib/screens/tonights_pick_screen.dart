import 'package:flutter/material.dart';

class TonightsPickScreen extends StatelessWidget {
  const TonightsPickScreen({super.key});

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
            letterSpacing: -0.5,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1280),
              child: Padding(
                padding: EdgeInsets.all(isDesktop ? 48 : 24),
                child: Container(
                  constraints: BoxConstraints(minHeight: isDesktop ? 618 : 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFD8D0C8).withOpacity(0.3),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 24,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: isDesktop
                        ? _buildDesktopLayout()
                        : _buildMobileLayout(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(child: _buildImageSection()),
          Expanded(child: _buildContentSection(true)),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        SizedBox(height: 256, child: _buildImageSection()),
        _buildContentSection(false),
      ],
    );
  }

  Widget _buildImageSection() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          'https://images.unsplash.com/photo-1509773896068-7fd415d91e2e?w=1200',
          fit: BoxFit.cover,
          alignment: Alignment.center,
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
                Colors.white.withOpacity(0.0),
                Colors.white.withOpacity(0.2),
                Colors.white,
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContentSection(bool isDesktop) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(isDesktop ? 64 : 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.star, color: Color(0xFF8C3C3C), size: 20),
              const SizedBox(width: 8),
              const Text(
                'CURATED FOR YOU',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8C3C3C),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontFamily: 'serif',
                fontSize: isDesktop ? 56 : 36,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF3A302A),
                height: 1.1,
              ),
              children: const [
                TextSpan(text: 'Dune:\n'),
                TextSpan(text: 'The Golden Path'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 448),
            child: Text(
              'An epic journey through shifting sands and political intrigue. Experience a masterpiece of visual storytelling bathed in the warmth of a dying sun. Hand-selected based on your recent cinematic mood.',
              style: TextStyle(
                fontSize: isDesktop ? 18 : 16,
                color: const Color(0xFF605850),
                fontWeight: FontWeight.w300,
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 32),
          if (isDesktop)
            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: [
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
                    elevation: 2,
                    shadowColor: const Color(0xFFC2652A).withOpacity(0.3),
                  ),
                  icon: const Icon(Icons.play_arrow, size: 24),
                  label: const Text(
                    'Watch Now',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF3A302A),
                    side: const BorderSide(color: Color(0xFF9A9088)),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.bookmark_add_outlined, size: 20),
                  label: const Text(
                    'Save for Later',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC2652A),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  icon: const Icon(Icons.play_arrow, size: 24),
                  label: const Text(
                    'Watch Now',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF3A302A),
                    side: const BorderSide(color: Color(0xFF9A9088)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.bookmark_add_outlined, size: 20),
                  label: const Text(
                    'Save for Later',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          SizedBox(height: isDesktop ? 48 : 32),
          Container(
            padding: EdgeInsets.only(top: isDesktop ? 32 : 24),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFFD8D0C8), width: 0.5),
              ),
            ),
            child: isDesktop
                ? Row(
                    children: [
                      Expanded(
                        child: _buildMetadataItem(
                          'DIRECTOR',
                          'Denis Villeneuve',
                        ),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        child: _buildMetadataItem('MOOD', 'Epic & Atmospheric'),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMetadataItem('DIRECTOR', 'Denis Villeneuve'),
                      const SizedBox(height: 16),
                      _buildMetadataItem('MOOD', 'Epic & Atmospheric'),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetadataItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF78706A),
            letterSpacing: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'serif',
            fontSize: 18,
            color: Color(0xFF3A302A),
          ),
        ),
      ],
    );
  }
}
