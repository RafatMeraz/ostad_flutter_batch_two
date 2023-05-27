import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/utils/app_colors.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/product_stepper.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          Image.asset(
            'assets/images/dummy_shoe.jpg',
            width: 120,
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'New shoe of Nike',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: greyColor),
                          ),
                          Row(
                            children: const [
                              Text(
                                'Size: 12',
                                style: TextStyle(color: greyColor),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'Color: Green',
                                style: TextStyle(color: greyColor),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete_forever_outlined,
                        color: softGreyColor,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '\$100',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                          fontSize: 16),
                    ),
                    ProductStepper(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
