import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screening_task/view_model/list_view_model.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef observe) {
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
    final viewModel = observe.watch(getDataFromApi);
    return Consumer(builder: (context, cartProvider, _) {
      return Scaffold(
        bottomSheet: viewModel.cartProductList.isNotEmpty
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.2),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 40.0),
                  child: SizedBox(
                    height: screenHeight * 0.07,
                    width: screenWidth,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const CheckoutScreen(),
                        //   ),
                        // );
                      },
                      label: const Icon(
                        FeatherIcons.shoppingCart,
                        color: Colors.white,
                        size: 22,
                      ),
                      icon: Text(
                        "الدفع",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.black12,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        primary: Colors.orange.withOpacity(.9),
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
        body: viewModel.cartProductList.isNotEmpty
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 15, right: 15),
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                            return Container(
                              height: screenHeight * .18,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 1),
                                      blurRadius: 5,
                                      color: Colors.black.withOpacity(0.2),
                                    )
                                  ],
                                  color: Colors.white),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          viewModel.cartProductList[index]
                                              .images!.first,
                                          width: 120,
                                          height: screenHeight * .18,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                          top: 0,
                                          left: 0,
                                          child: CircleAvatar(
                                            radius: 22,
                                            child: Text(
                                              "${viewModel.cartProductList[index].discountPercentage.toString() + "%"}",
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
                                    child: Row(
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
                                                  width: screenWidth * 0.36,
                                                  child: Text(
                                                    viewModel
                                                        .cartProductList[index]
                                                        .title
                                                        .toString(),
                                                    maxLines: 1,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                        ),
                                                  ),
                                                ),
                                                _buildRatingStars(viewModel
                                                    .cartProductList[index]
                                                    .rating!
                                                    .toInt()),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  viewModel
                                                      .cartProductList[index]
                                                      .brand
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black
                                                            .withOpacity(.6),
                                                        fontSize: 14,
                                                      ),
                                                ),
                                                SizedBox(
                                                  width: screenWidth * .33,
                                                ),
                                                Container(
                                                  // width: 60,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                      color: Colors.orange
                                                          .withOpacity(.9),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                            blurRadius: 3,
                                                            color:
                                                                Colors.black12,
                                                            offset: Offset(
                                                                0.6, 0.6))
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Center(
                                                    child: Text(
                                                      viewModel
                                                          .cartProductList[
                                                              index]
                                                          .price
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IntrinsicHeight(
                                                  child: Container(
                                                    height: 35,
                                                    width: 100,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                            color:
                                                                Colors.black12,
                                                            spreadRadius: 1),
                                                      ],
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            if (viewModel
                                                                    .cartProductList[
                                                                        index]
                                                                    .stock! >=
                                                                1) {
                                                              viewModel.increaseCounterNumber(
                                                                  viewModel
                                                                          .cartProductList[
                                                                      index]);
                                                            }
                                                          },
                                                          child: const Icon(
                                                            FeatherIcons.plus,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${viewModel.cartProductList[index].counter ?? 1}",
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
                                                                            .w900,
                                                                    color: Colors
                                                                        .orange
                                                                        .withOpacity(
                                                                            .9),
                                                                    fontSize:
                                                                        20,
                                                                  ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            if (viewModel
                                                                    .cartProductList[
                                                                        index]
                                                                    .counter! >
                                                                1) {
                                                              viewModel.decreaseCounterNumber(
                                                                  viewModel
                                                                          .cartProductList[
                                                                      index]);
                                                            }
                                                          },
                                                          child: const Icon(
                                                            FeatherIcons.minus,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 80,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    viewModel.deleteFromCart(
                                                        viewModel
                                                                .cartProductList[
                                                            index]);
                                                  },
                                                  child: const Icon(
                                                    FeatherIcons.trash,
                                                    color: Colors.red,
                                                    size: 22,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (ctx, index) {
                            return const SizedBox(
                              height: 12,
                            );
                          },
                          itemCount: viewModel.cartProductList.length),
                    ),
                    SizedBox(
                      height: screenHeight * 0.2,
                    )
                  ],
                ),
              )
            : Center(
                child: Text(
                "There Is No Cart Items Here",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.black),
              )),
      );
    });
  }
}
