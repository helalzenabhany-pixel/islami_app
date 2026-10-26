class OnboardingContent {
  final String image;
  final String title;
  final String description;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

// دي البيانات الخاصة بالـ 5 شاشات الموجودة في التصميم
List<OnboardingContent> contents = [
  OnboardingContent(
    title: 'Welcome To Islami App',
    image: 'assets/images/welcome.png', // غيري اسم الصورة حسب المسمى عندك
    description: '',
  ),
  OnboardingContent(
    title: 'Welcome To Islam',
    image: 'assets/images/mosque.png',
    description: 'We Are Very Excited To Have You In Our Community',
  ),
  OnboardingContent(
    title: 'Reading the Quran',
    image: 'assets/images/quran.png',
    description: 'Read, and your Lord is the Most Generous',
  ),
  OnboardingContent(
    title: 'Bearish ',
    image: 'assets/images/tasbih.png',
    description: 'Praise the name of your Lord, the Most High',
  ),
  OnboardingContent(
    title: 'Holy Quran Radio',
    image: 'assets/images/mic.png',
    description: 'You can listen to the Holy Quran Radio through the application for free and easily',
  ),
];