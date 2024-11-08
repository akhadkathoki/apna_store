// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:apna_store/img_file.dart';
import 'package:flutter/material.dart';

import 'package:apna_store/models/categories.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      child: Stack(
        children: [
          Image.network(
            productImg,
            height: 300, // Customize image height
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(204, 43, 19, 0).withOpacity(0.9),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(107, 81, 60, 34),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "alsdk asldkfjaskd flasdjf kdfj ;la dfalkdf alksdjfl ;k dfl;askdjf la;sk df;l",
                      // product["subtitle"],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(190, 255, 255, 255),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${item.discountPercentage}% Off',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 253, 209, 174),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '\$${item.actualPrice}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough,
                                    color: Color.fromARGB(255, 180, 180, 179),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '\$${item.discountPrice}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 253, 209, 174),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: Container(
                        //     padding: const EdgeInsets.all(7),
                        //     decoration: const BoxDecoration(
                        //       color: Color(0xFFFAE3C6),
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(100)),
                        //     ),
                        //     child: const Icon(
                        //       Icons.shopping_cart,
                        //       size: 20,
                        //       color: Color(0xFF4F2D19),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
