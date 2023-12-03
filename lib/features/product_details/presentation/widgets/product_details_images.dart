import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsImages extends StatefulWidget {
  const ProductDetailsImages({
    super.key,
    required this.imageUrl,
  });

  final List<String> imageUrl;

  @override
  State<ProductDetailsImages> createState() => _ProductDetailsImagesState();
}

class _ProductDetailsImagesState extends State<ProductDetailsImages> {
  int currentPage = 0;
  final PageController _pageController = PageController();
  late final Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(seconds: 3),
      (Timer timer) {
        if (currentPage < widget.imageUrl.length - 1) {
          currentPage++;
          _pageController.animateToPage(
            currentPage,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeIn,
          );
        } else {
          currentPage = -1;
        }
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: (details) {
        if (details.delta.dx > 0 || details.delta.dx < 0) {
          timer.cancel();
        }
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.515,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.imageUrl.length,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: widget.imageUrl[index],
                  width: double.infinity,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 45.h,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: widget.imageUrl.length,
              effect: const ScrollingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeStrokeWidth: 5,
                activeDotColor: Colors.white,
                dotColor: Colors.white,
                strokeWidth: 5,
              ),
              onDotClicked: (index) => _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
