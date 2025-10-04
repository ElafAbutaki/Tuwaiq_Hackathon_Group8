import 'package:darkom/App_Theme/app_sizes.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({super.key});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  final PageController _controller = PageController(); 
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.newsCardRadius),
                    bottomLeft: Radius.circular(AppSizes.newsCardRadius),
                    bottomRight: Radius.circular(AppSizes.newsCardRadius),
                    ),
                  child: Image.asset(
                    'images/HomeScreen/News/News3.jpg',
                    width: AppSizes.newsCardWidth,
                    height: 166,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.newsCardRadius),
                    bottomLeft: Radius.circular(AppSizes.newsCardRadius),
                    bottomRight: Radius.circular(AppSizes.newsCardRadius),
                    ),
                  child: Image.asset(
                    'images/HomeScreen/News/News2.png',
                    width: AppSizes.newsCardWidth,
                    height: AppSizes.newsCardHeight,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.newsCardRadius),
                    bottomLeft: Radius.circular(AppSizes.newsCardRadius),
                    bottomRight: Radius.circular(AppSizes.newsCardRadius),
                    ),
                  child: Image.asset(
                    'images/HomeScreen/News/News1.jpg', 
                    width: AppSizes.newsCardWidth,
                    height: AppSizes.newsCardHeight,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.newsCardRadius),
                    bottomLeft: Radius.circular(AppSizes.newsCardRadius),
                    bottomRight: Radius.circular(AppSizes.newsCardRadius),
                    ),
                  child: Image.asset(
                    'images/HomeScreen/News/News2.png', 
                    width: AppSizes.newsCardWidth,
                    height: AppSizes.newsCardHeight,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            ],
          ),
        ),
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
              3,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 7,
                height: 7,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}