import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shadowColor: primaryColor.withOpacity(0.2),
        child: Column(
          children: [
            Image.asset(
              'assets/images/dummy_shoe.jpg',
              width: 132,
              height: 90,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Nike Casual Shoe A345G',
                    style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.3,
                        height: 1.2,
                        fontWeight: FontWeight.w500,
                        color: greyColor.withOpacity(0.7)),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Text(
                        '\$340',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: primaryColor),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 14,
                          ),
                          Text(
                            '4.5',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: softGreyColor),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Icon(
                            Icons.favorite_border,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
