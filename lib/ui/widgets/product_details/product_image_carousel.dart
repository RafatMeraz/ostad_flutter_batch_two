import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class ProductImageCarousel extends StatelessWidget {
  final ValueNotifier<int> _currentCarouselIndex = ValueNotifier(0);

  final List<String> images;

  ProductImageCarousel({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 200.0,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, _) {
                _currentCarouselIndex.value = index;
              }),
          items: images.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl)
                    )
                  ),
                  alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ValueListenableBuilder(
                valueListenable: _currentCarouselIndex,
                builder: (context, currentValue, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < images.length; i++)
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                color: currentValue == i
                                    ? primaryColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
