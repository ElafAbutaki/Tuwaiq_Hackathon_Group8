import 'package:darkom/App_Theme/app_sizes.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({super.key});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  late final PageController _controller;

  // raw page index (from PageView) and a logical index for the dots.
  int _rawIndex = 0;      // what PageView reports (gets flipped by `reverse: true`)
  int _dotIndex = 0;      // what we show in the indicator (0..n-1 in natural order)

  final List<String> _images = const [
    'images/HomeScreen/News/News1.jpg',
    'images/HomeScreen/News/News2.png',
    'images/HomeScreen/News/News3.jpg',
  ];

  @override
  void initState() {
    super.initState();
    // Start on the last physical page so the *first* item appears on the right.
    _controller = PageController(initialPage: _images.length - 1);
    // Initial logical index is 0 (first dot)
    _rawIndex = _images.length - 1;
    _dotIndex = 0;
  }

  void _onPageChanged(int raw) {
    // When using reverse:true, swipe-left *decreases* the raw index.
    // Map raw index -> logical index so dots move with swipe direction.
    setState(() {
      _rawIndex = raw;
      _dotIndex = (_images.length - 1) - raw; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _controller,
            reverse: true,                 // shows first card on the right
            onPageChanged: _onPageChanged, // keep dots in sync with swipe
            itemCount: _images.length,
            itemBuilder: (context, index) {
              final path = _images[index]; // already reversed by PageView
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.newsCardRadius),
                    bottomLeft: Radius.circular(AppSizes.newsCardRadius),
                    bottomRight: Radius.circular(AppSizes.newsCardRadius),
                  ),
                  child: Image.asset(
                    path,
                    width: AppSizes.newsCardWidth,
                    height: AppSizes.newsCardHeight,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),

        // Dots
        Container(
          width: 100,
          height: 15,
          margin: const EdgeInsets.all(1),
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 39, 39, 39),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _images.length,
              (i) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _dotIndex == i ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
