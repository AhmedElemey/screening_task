import 'dart:async';
import 'package:flutter/material.dart';
import 'package:screening_task/models/product_model.dart';
import 'package:screening_task/services/list_service.dart';
import 'package:screening_task/view_model/list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ProductView extends ConsumerWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef observe) {
    final viewModel = observe.watch(getDataFromApi);
    Text _buildRatingStars(int rating) {
      String stars = '';
      for (int i = 0; i < rating; i++) {
        stars += '⭐';
      }
      stars.trim();
      return Text(stars);
    }

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: viewModel.productList.isNotEmpty
          ? SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: screenWidth,
                      child: ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            Products productItems =
                                viewModel.productList[index];
                            return InkWell(
                              child: Container(
                                height: screenHeight * .23,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.withOpacity(0.2)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            productItems.images![0],
                                            width: 120,
                                            height: screenHeight * .23,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                            top: -.5,
                                            left: -.5,
                                            child: CircleAvatar(
                                              radius: 22,
                                              child: Text(
                                                "${productItems.discountPercentage.toString() + "%"}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              backgroundColor: Colors.orange,
                                            ))
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width:
                                                            screenWidth * 0.37,
                                                        child: Text(
                                                          productItems.title
                                                              .toString(),
                                                          maxLines: 1,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1!
                                                                  .copyWith(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        13,
                                                                  ),
                                                        ),
                                                      ),
                                                      // const SizedBox(
                                                      //   width: 5,
                                                      // ),
                                                      _buildRatingStars(
                                                          productItems.rating!
                                                              .toInt()),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    productItems.brand
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black
                                                              .withOpacity(.6),
                                                          fontSize: 13,
                                                        ),
                                                  ),
                                                  const SizedBox(
                                                    height: 12,
                                                  ),
                                                  SizedBox(
                                                    width: screenWidth * .55,
                                                    child: Text(
                                                      "${productItems.description.toString()}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.black,
                                                            fontSize: 12,
                                                          ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 12,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: 57,
                                                        height: 25,
                                                        decoration: BoxDecoration(
                                                            color: Colors.orange
                                                                .withOpacity(
                                                                    .9),
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                  blurRadius: 3,
                                                                  color: Colors
                                                                      .black12,
                                                                  offset:
                                                                      Offset(
                                                                          0.6,
                                                                          0.6))
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Center(
                                                          child: Text(
                                                            "${productItems.price.toString() + " LE"}",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText1!
                                                                .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 12,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            screenWidth * 0.31,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          print("aloo");
                                                          if (!viewModel
                                                              .cartProductList
                                                              .contains(
                                                                  productItems)) {
                                                            productItems
                                                                .counter = 1;
                                                            viewModel.addToCart(
                                                                productItems);
                                                          }
                                                        },
                                                        child: const Icon(
                                                          FeatherIcons
                                                              .shoppingCart,
                                                          color: Colors.black,
                                                          size: 22,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                                height: 18,
                              ),
                          itemCount: viewModel.productList.length),
                    ),
                  ],
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
