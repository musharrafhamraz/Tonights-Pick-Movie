# 🎬 Sahara - Movie Discovery App

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

*A beautifully crafted movie discovery experience that matches your mood*

[Features](#features) • [Screenshots](#screenshots) • [Getting Started](#getting-started) • [Design System](#design-system)

</div>

---

## ✨ Overview

Sahara is a mood-based movie discovery application that helps you find the perfect film for any moment. With its warm, cinematic design inspired by desert landscapes and golden hour lighting, Sahara transforms movie browsing into an elegant, personalized experience.

## 🎯 Features

### 🎭 Mood-Based Discovery
- Select from curated mood categories: Funny, Mind-Bending, Comforting, Thrilling, Short, and Inspiring
- Unique bento grid layout with carefully designed proportions
- Instant mood-to-movie matching

### 🃏 Swipeable Movie Cards
- Tinder-style card interface for browsing movies
- Smooth animations and intuitive gestures
- Quick access to movie details

### 🌟 Tonight's Pick
- Personalized movie recommendation feature
- Split-screen layout showcasing featured content
- One-tap access to your perfect evening watch

### 📚 Watchlist Management
- Save movies and series for later
- Filter by type: Movies, Series, Documentaries
- Beautiful card-based grid layout

### 👤 User Profile
- Track your viewing statistics
- View mood history and streaks
- Manage preferences and settings
- Connected streaming services

### 📱 Content Details
- Rich movie information pages
- Cast & crew showcase
- Ratings, runtime, and metadata
- Hero image with elegant gradients

## 🎨 Design System

### Color Palette
```dart
Primary: #C2652A (Burnt Orange)
Background: #FAF5EE (Warm Beige)
Surface: #F6F0E8 (Light Sand)
Text: #3A302A (Deep Brown)
Secondary: #78706A (Warm Gray)
```

### Typography
- **Headlines**: EB Garamond (Serif) - Elegant and cinematic
- **Body**: Manrope (Sans-serif) - Clean and readable
- Responsive font sizes across all screen sizes

### Design Principles
- Warm, inviting color scheme inspired by desert landscapes
- Generous spacing and breathing room
- Subtle shadows and smooth transitions
- Fully responsive from mobile to desktop
- Consistent 12-16px border radius throughout

## 📸 Screenshots

### Mobile Views
- **Mood Selection**: Bento grid with 6 mood categories
- **Movie Discovery**: Swipeable card interface with drawer navigation
- **Tonight's Pick**: Featured movie recommendation
- **Watchlist**: Grid of saved content with filters
- **Profile**: User stats, mood history, and settings
- **Content Detail**: Rich movie information page

### Desktop Experience
- Side navigation replacing bottom bar
- Optimized layouts for larger screens
- Enhanced grid systems (3-4 columns)

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code with Flutter extensions
- iOS Simulator / Android Emulator

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/sahara-movie-app.git
cd sahara-movie-app
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
flutter run
```

### Build for Production

**Android**
```bash
flutter build apk --release
```

**iOS**
```bash
flutter build ios --release
```

**Web**
```bash
flutter build web --release
```

## 📁 Project Structure

```
lib/
├── main.dart                          # App entry point
└── screens/
    ├── mood_selection_screen.dart     # Mood category selection
    ├── movie_discovery_screen.dart    # Swipeable movie cards
    ├── tonights_pick_screen.dart      # Featured recommendation
    ├── content_detail_screen.dart     # Movie details page
    ├── watchlist_screen.dart          # Saved content
    └── profile_screen.dart            # User profile

assets/
└── *.html                             # Original design references
```

## 🛠️ Technical Highlights

### Responsive Design
- LayoutBuilder for adaptive layouts
- MediaQuery for screen size detection
- Breakpoints: Mobile (<768px), Desktop (≥768px)

### State Management
- StatefulWidget for local state
- Efficient rebuilds with setState

### UI Components
- Custom card designs with gradients
- Swipeable card stack implementation
- Bento grid with custom proportions
- Smooth page transitions

### Performance
- Optimized image loading with error handling
- Efficient list rendering with GridView
- Minimal widget rebuilds

## 🎯 Key Screens Breakdown

### Mood Selection Screen
4-row bento grid layout:
- Row 1: Funny (2 columns)
- Row 2: Mind-Bending (1 col) + Comforting (1 col)
- Row 3: Thrilling (1 col) + Short (1 col)
- Row 4: Inspiring (2 columns)

### Movie Discovery Screen
- Swipeable card stack
- Drawer navigation with user profile
- Floating action button for Tonight's Pick
- Bottom navigation bar (mobile)

### Profile Screen
- User avatar with edit button
- Stats grid: Movies Watched, Saved, Mood Streak
- Mood history timeline
- Preferences with toggle switches
- Account management options

## 🔮 Future Enhancements

- [ ] Integration with real movie APIs (TMDB, OMDB)
- [ ] User authentication and cloud sync
- [ ] Social features (share recommendations)
- [ ] Advanced filtering and search
- [ ] Streaming service availability
- [ ] Watch history tracking
- [ ] Personalized recommendations using ML
- [ ] Dark mode support
- [ ] Offline mode with local caching

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Design inspiration from modern streaming platforms
- Color palette inspired by desert landscapes and golden hour cinematography
- Typography choices for optimal readability and elegance
- Flutter community for excellent packages and resources

## 📧 Contact

Your Name - Musharraf Hamraz

Project Link: [https://github.com/musharrafhamraz/sahara-movie-app](https://github.com/musharrafhamraz/sahara-movie-app)

---

<div align="center">

**Made with ❤️ and Flutter**

⭐ Star this repo if you find it helpful!

</div>
