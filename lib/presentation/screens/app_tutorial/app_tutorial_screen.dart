import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/router/app_router.dart';

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
    caption:
        'Esta es una aplicación de ejemplo para mostrar las capacidades de Flutter',
    imageUrl: 'assets/images/1.png',
  ),
  const SlideInfo(
    title: 'Pantalla 2',
    caption: 'Et consequat adipisicing nisi quis aute mollit esse aliqua amet.',
    imageUrl: 'assets/images/2.png',
  ),
  const SlideInfo(
    title: 'Pantalla 3',
    caption:
        'Cupidatat fugiat ullamco exercitation quis incididunt laboris dolor cupidatat.',
    imageUrl: 'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      //print('${pageViewController.page}');
      final page = pageViewController.page ?? 0;
      if (!isLastPage && page >= slides.length - 1.5) {
        setState(() {
          isLastPage = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slide) =>
                    _Slide(slide.title, slide.caption, slide.imageUrl))
                .toList(),
          ),
          Positioned(
              top: 40,
              right: 20,
              child: TextButton(
                  onPressed: () => context.pop(), child: const Text('Salir'))
                  ),
          isLastPage ? Positioned(
            bottom: 30,
            right: 20,
            child: FadeInRight(
              from: 15,
              delay: const Duration(milliseconds: 500),
              child: FilledButton(onPressed: () => context.pop(), child: const Text('Comenzar')))
            ) : const SizedBox.shrink(),
        ],
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
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage(imageUrl)),
              const SizedBox(height: 20),
              Text(title, style: titleStyle),
              const SizedBox(height: 10),
              Text(caption, style: captionStyle),
            ],
          ),
        ));
  }
}
