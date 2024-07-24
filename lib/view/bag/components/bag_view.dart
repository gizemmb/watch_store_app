import 'package:flutter/material.dart';
import 'package:watches_app/models/watch_model.dart';
import '../../../animations/fade_animations.dart';
import '../../../data/dummy_data.dart';
import '../../../theme/custom_app_theme.dart';
import '../../../utils/constants.dart';
import 'empt_state.dart';

class BagView extends StatefulWidget {
  const BagView({super.key});

  @override
  State<BagView> createState() => _BagViewState();
}

class _BagViewState extends State<BagView> {
  Map<WatchModel, int> itemQuantities = {};
  int lengthsOfItemsOnBag = itemsOnBag.length;

  @override
  void initState() {
    super.initState();
    for (var item in itemsOnBag) {
      itemQuantities[item] = 1;
    }
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    itemQuantities.forEach((item, quantity) {
      totalPrice += item.price * quantity;
    });
    return totalPrice;
  }

  int calculateTotalItems() {
    int totalItems = 0;
    itemQuantities.forEach((item, quantity) {
      totalItems += quantity;
    });
    return totalItems;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      top: false,
      child: Scaffold(
          backgroundColor: AppConstantsColor.backgroundColor,
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: width,
            height: height,
            child: Column(
              children: [
                _bagAppBar(width, height),
                itemsOnBag.isEmpty
                    ? const EmptyState()
                    : Column(
                        children: [
                          _mainProductList(width, height),
                          _bottomInfo(width, height),
                        ],
                      )
              ],
            ),
          )),
    );
  }

  Widget _bottomInfo(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.12,
      child: Column(
        children: [
          FadeAnimations(
              delay: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "TOTAL",
                    style: AppThemes.bagTotalPrice,
                  ),
                  Text(
                    "\$${calculateTotalPrice()}",
                    style: AppThemes.bagSumOfItemOnBag,
                  ),
                ],
              )),
          const SizedBox(
            height: 15,
          ),
          materialButton(width, height)
        ],
      ),
    );
  }

  Widget materialButton(width, height) {
    return FadeAnimations(
        delay: 1,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          minWidth: width / 1.2,
          height: height / 15,
          color: AppConstantsColor.appthemeColorOther,
          onPressed: () {},
          child: const Text(
            "BUY NOW",
            style:
                TextStyle(color: AppConstantsColor.appthemeColor, fontSize: 18),
          ),
        ));
  }

  Widget _mainProductList(width, height) {
    return SizedBox(
      width: width / 1.1,
      height: height * 0.63,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: itemsOnBag.length,
        itemBuilder: (context, index) {
          WatchModel currentBagItem = itemsOnBag[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            width: width,
            height: height / 4,
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.55,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        width: width * 0.5,
                        child: Image.asset(currentBagItem.imgAddress), 
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currentBagItem.name,
                      style: AppThemes.bagProductName,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "\$${currentBagItem.price}",
                      style: AppThemes.bagProductPrice,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (itemQuantities[currentBagItem]! > 1) {
                                itemQuantities[currentBagItem] =
                                    itemQuantities[currentBagItem]! - 1;
                              } else {
                                itemsOnBag.remove(currentBagItem);
                                itemQuantities.remove(currentBagItem);
                              }
                              lengthsOfItemsOnBag = itemsOnBag.length;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300]),
                            child: const Center(
                              child: Icon(
                                Icons.remove,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "${itemQuantities[currentBagItem]}",
                            style: AppThemes.bagProductNumOfWatch,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              itemQuantities[currentBagItem] =
                                  itemQuantities[currentBagItem]! + 1;
                              lengthsOfItemsOnBag = itemsOnBag.length;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300]),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  SizedBox _bagAppBar(double width, double height) {
    return SizedBox(
        width: width,
        height: height / 7,
        child: FadeAnimations(
            delay: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "My Cart",
                    style: AppThemes.bagTitle,
                  ),
                  Text(
                    "Total ${calculateTotalItems()} Product",
                    style: AppThemes.bagTotalPrice,
                  )
                ],
              ),
            )));
  }
}
