import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/data/models/cart_list_model.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/cart_controller.dart';
import 'package:ostad_flutter_batch_two/ui/utils/app_colors.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/product_stepper.dart';

class CartProductItem extends StatefulWidget {
  CartProductItem({Key? key, required this.cartData}) : super(key: key);

  CartData cartData;

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              widget.cartData.product?.image ?? '',
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
                            Text(
                              widget.cartData.product?.title ?? '',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: greyColor),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Size: ${widget.cartData.size}',
                                  style: const TextStyle(color: greyColor),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Color: ${widget.cartData.color}',
                                  style: const TextStyle(color: greyColor),
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
                    children: [
                      Text(
                        '\$${widget.cartData.product?.price ?? ''}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                            fontSize: 16),
                      ),
                      ProductStepper(
                        onDecrement: (int currentValue) {
                          Get.find<CartController>().decrementItem(widget.cartData.id!);
                        },
                        onIncrement: (int currentValue) {
                          Get.find<CartController>().incrementItem(widget.cartData.id!);
                        },
                      ),
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
