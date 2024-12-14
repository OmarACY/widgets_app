import 'package:flutter/material.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  const SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}


final slides = <SlideInfo>[
  const SlideInfo(
    title: 'Bienvenido a la aplicación',
    caption: 'Esta es una aplicación de ejemplo para mostrar las capacidades de Flutter',
    imageUrl: 'assets/images/1.png',
  ),
  const SlideInfo(
    title: 'Pantalla 2',
    caption: 'Et consequat adipisicing nisi quis aute mollit esse aliqua amet.',
    imageUrl: 'assets/images/1.png',
  ),
  const SlideInfo(
    title: 'Pantalla 3',
    caption: 'Cupidatat fugiat ullamco exercitation quis incididunt laboris dolor cupidatat.',
    imageUrl: 'assets/images/1.png',
  ),
];


class AppTutorialScreen extends StatelessWidget {

  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const BouncingScrollPhysics(),
        children: slides.map((slide) => _Slide(slide.title, slide.caption, slide.imageUrl)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(this.title, this.caption, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}