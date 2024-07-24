import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../animations/fade_animations.dart';
import '../../../data/dummy_data.dart';
import '../../../models/watch_model.dart';
import '../../../theme/custom_app_theme.dart';
import '../../../utils/constants.dart';
import '../../details/components/details_view.dart';
import 'home_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndexOfCategory = 0;
  List<WatchModel> selectedWatches = [];

  @override
  void initState() {
    super.initState();
    _updateSelectedWatches();
  }

  void _updateSelectedWatches() {
    final watchLists = [
      guessWatches,
      mkWatches,
      swWatches,
      tommyWatches,
      versaceWatches
    ];
    selectedWatches = watchLists[selectedIndexOfCategory];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: const HomeAppBar(),
        body: Column(
          children: [
            _categoryView(size),
            SizedBox(height: size.height * 0.01),
            _mainShoesListView(size),
            _moreTextandIcon(),
            _bottomSideCategory(size)
          ],
        ),
      ),
    );
  }

  SizedBox _bottomSideCategory(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.24,
      child: ListView.builder(
          itemCount: selectedWatches.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final watch = selectedWatches[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsView(
                            isComeFromMoreSection: true,
                            watch: watch,
                            selectedIndexOfCategory: selectedIndexOfCategory,
                          ))),
              child: Container(
                margin: const EdgeInsets.all(10),
                width: size.width * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      left: 4,
                      child: FadeAnimations(
                        delay: 1,
                        child: Container(
                          width: size.width / 13,
                          height: size.height / 10,
                          color: AppConstantsColor.appthemeColorOther,
                          child: const RotatedBox(
                            quarterTurns: -1,
                            child: Center(
                              child: FadeAnimations(
                                delay: 1.5,
                                child: Text(
                                  "NEW",
                                  style: AppThemes.homeGridNewText,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 70,
                      child: FadeAnimations(
                        delay: 1,
                        child: SizedBox(
                          width: 200,
                          height: 100,
                          child: Image.asset(watch.imgAddress),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 35,
                      child: FadeAnimations(
                        delay: 1,
                        child: FittedBox(
                          child: Text(
                            watch.name,
                            style: AppThemes.homeGridNameAndModel,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: FadeAnimations(
                        delay: 1,
                        child: Text(
                          "\$${watch.price.toStringAsFixed(2)}",
                          style: AppThemes.homeGridPrice,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Padding _moreTextandIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          const Text(
            "More",
            style: AppThemes.homeMoreText,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.arrow_right,
              size: 27,
            ),
          )
        ],
      ),
    );
  }

  Row _mainShoesListView(Size size) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: size.height * 0.4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: selectedWatches.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final watch = selectedWatches[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsView(
                          isComeFromMoreSection: false,
                          watch: watch,
                          selectedIndexOfCategory: selectedIndexOfCategory,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.005,
                        vertical: size.width * 0.01),
                    width: size.width / 1.5,
                    child: Stack(
                      children: [
                        Container(
                          width: size.width / 1.7,
                          decoration: BoxDecoration(
                            color: watch.modelColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Positioned(
                          left: 15,
                          right: 40,
                          child: FadeAnimations(
                            delay: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  watch.name,
                                  style: AppThemes.homeProductName,
                                ),
                                
                                 const Icon(
                                    Icons.favorite_border,
                                    color: AppConstantsColor.appthemeColorOther,
                                  ),
                                
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 18,
                          left: 75,
                          child: FadeAnimations(
                            delay: 2,
                            child: Text(
                              "\$${watch.price.toStringAsFixed(2)}",
                              style: AppThemes.homeProductPrice,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 26.5,
                          top: 50,
                          child: FadeAnimations(
                            delay: 1.5,
                            child: Hero(
                              tag: watch.imgAddress,
                              child: SizedBox(
                                width: 240,
                                height: 230,
                                child: Image(
                                  image: AssetImage(watch.imgAddress),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          left: 170,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsView(
                                    isComeFromMoreSection: false,
                                    watch: watch,
                                    selectedIndexOfCategory:
                                        selectedIndexOfCategory,
                                  ),
                                ),
                              );
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.arrowRight,
                              color: AppConstantsColor.appthemeColorOther,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _categoryView(Size size) {
    return Row(
      children: [
        SizedBox(
          width: size.width,
          height: size.height * 0.04,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndexOfCategory = index;
                    _updateSelectedWatches();
                  });
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        fontSize: selectedIndexOfCategory == index ? 22 : 18,
                        color: selectedIndexOfCategory == index
                            ? AppConstantsColor.darkTextColor
                            : AppConstantsColor.appthemeColorOther,
                        fontWeight: selectedIndexOfCategory == index
                            ? FontWeight.bold
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
