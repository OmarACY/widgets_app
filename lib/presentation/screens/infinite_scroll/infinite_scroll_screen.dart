import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {


  List<int> imagesIds = [1,2,3,4,5,6,7,8,9,10];

  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {

    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    
    addFiveImages();
    isLoading = false;

    if( !isMounted ) return;

    setState(() {});
    
  }

  void addFiveImages() {
    final lastImageId = imagesIds.last;
    imagesIds.addAll([1,2,3,4,5].map((i) => lastImageId + i));
//    for (var i = 1; i <= 5; i++) {
//      imagesIds.add(lastImageId + i);
//    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          // If we remove item count we have an infinite list
          itemCount: imagesIds.length,
          controller: scrollController,
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
        child: isLoading ? SpinPerfect(
          infinite: true,
          child: const Icon(Icons.refresh_rounded))
          : FadeIn(child: const Icon(Icons.arrow_back_ios_new_rounded)),

      ),
    );
  }
}
