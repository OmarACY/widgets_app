import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          //itemCount: 100,
          itemBuilder: (context, index) {
          return FadeInImage(
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/500/300/?image=$index'),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        //Navigator.pop(context);
        context.pop();
      },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
