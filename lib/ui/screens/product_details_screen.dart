import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/utils/app_colors.dart';
import 'package:ostad_flutter_batch_two/ui/utils/styles.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/product_details/product_image_carousel.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/product_stepper.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: const BackButton(
          color: greyColor,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImageCarousel(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Addidas Casual Shoe s4657 Brand new',
                            style: titleTextStyle.copyWith(fontSize: 18),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
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
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: softGreyColor),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Reviews',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: primaryColor),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                   const SizedBox(width: 8,),
                   const ProductStepper()
                  ],
                ),
                const Text('Color'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


