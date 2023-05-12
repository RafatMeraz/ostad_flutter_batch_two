import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/utils/app_colors.dart';
import 'package:ostad_flutter_batch_two/ui/utils/styles.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/common_elevated_button.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/product_details/product_image_carousel.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/product_stepper.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  List<Color> colors = const [
    Color(0xFF000000),
    Color(0xFF7B2828),
    Color(0xFF251497),
    Color(0xFF08781A),
    Color(0xFF7E0472),
  ];
  List<String> sizes = const [
    'S',
    'L',
    'XL',
    'XXL',
    'XXXL',
  ];

  Color _selectedColor =  const Color(0xFF000000);
  String _selectedSize =  'L';

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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageCarousel(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                           const ProductStepper(),
                          ],
                        ),
                        const SizedBox(height: 16,),
                        const Text('Color', style: TextStyle(
                          fontSize: 20,
                          color: greyColor,
                          fontWeight: FontWeight.w600
                        ),),
                        const SizedBox(height: 16,),
                        Row(
                            children: colors.map((color) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    if (_selectedColor != color) {
                                      _selectedColor = color;
                                      if (mounted) {
                                        setState(() {

                                        });
                                      }
                                    }
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: color,
                                    radius: 15,
                                    child: Visibility(
                                        visible: color == _selectedColor,
                                        child: const Icon(Icons.check, color: Colors.white,)),
                                  ),
                                ),
                              );
                            }).toList(),
                        ),
                        const SizedBox(height: 16,),
                        const Text('Size', style: TextStyle(
                          fontSize: 20,
                          color: greyColor,
                          fontWeight: FontWeight.w600
                        ),),
                        const SizedBox(height: 16,),
                        Row(
                            children: sizes.map((size) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    if (_selectedSize != size) {
                                      _selectedSize = size;
                                      if (mounted) {
                                        setState(() {

                                        });
                                      }
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                        color: greyColor
                                      ),
                                      color: size == _selectedSize ? primaryColor : null
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(size, style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: size == _selectedSize ? Colors.white : null
                                      ),),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                        ),
                        const SizedBox(height: 16,),
                        const Text('Description', style: TextStyle(
                            fontSize: 20,
                            color: greyColor,
                            fontWeight: FontWeight.w600
                        ),),
                        const SizedBox(height: 16,),
                        const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley", style: TextStyle(
                            fontSize: 14,
                            color: softGreyColor,
                            fontWeight: FontWeight.w400
                        ),),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.15),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              )
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Price', style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: softGreyColor
                      ),),
                      Text(
                          '\$100',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                          )
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 120,
                    child: CommonElevatedButton(
                      onTap: () {},
                      title: 'Add to Cart',
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


