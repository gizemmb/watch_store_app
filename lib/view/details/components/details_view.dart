import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:watches_app/view/details/components/appbar.dart';
import '../../../animations/fade_animations.dart';
import '../../../data/dummy_data.dart';
import '../../../models/watch_model.dart';
import '../../../theme/custom_app_theme.dart';
import '../../../utils/app_methods.dart';
import '../../../utils/constants.dart';

class DetailsView extends StatefulWidget {
  final WatchModel watch;
  final bool isComeFromMoreSection;
  final int selectedIndexOfCategory;

  const DetailsView({
    required this.watch,
    required this.isComeFromMoreSection,
    required this.selectedIndexOfCategory,
    super.key,
  });

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  bool _isExpanded = false;

  String _getCategoryTitle(int selectedIndex) {
    return categories[selectedIndex % categories.length];
  }

  void _toggleMoreDetails() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: CustomDetailsViewAppBar(
          title: _getCategoryTitle(widget.selectedIndexOfCategory),
        ),
        body: SizedBox(
          width: size.width,
          height: size.height * 1.4,
          child: Column(
            children: [
              _topProductImageandBag(size),
              _morePicOfProduct(size),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _productNameAndPrice(size),
                    _productInfo(size.width, size.height),
                    _moreDetailsText(size.width, size.height),
                    _bottomSizeandButton(size),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomSizeandButton(Size size) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      width: size.width,
      height: size.height * 0.1,
      child: FadeAnimations(
        delay: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _sizeButton(size),
            _addToCartButton(size),
          ],
        ),
      ),
    );
  }

  Widget _sizeButton(Size size) {
    return Container(
      width: size.width / 3,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppConstantsColor.appthemeColorOther,
          width: 3,
        ),
      ),
      child: MaterialButton(
        onPressed: () => _showSizeGuideDialog(context),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "ÖLÇÜ",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
            FaIcon(FontAwesomeIcons.rulerHorizontal),
          ],
        ),
      ),
    );
  }

  Widget _addToCartButton(Size size) {
    return SizedBox(
      width: size.width / 2,
      child: Center(
        child: MaterialButton(
          minWidth: size.width / 2,
          height: size.height / 13,
          color: AppConstantsColor.appthemeColorOther,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            AppMethods.addToCart(widget.watch, context);
          },
          child: const Text(
            'ADD TO CART',
            style: TextStyle(
              color: AppConstantsColor.appthemeColor,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  void _showSizeGuideDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/case.jpg'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ElevatedButton(
                  onPressed: Navigator.of(context).pop,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConstantsColor.appthemeColorOther,
                  ),
                  child: const Text(
                    'Close',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppConstantsColor.appthemeColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _moreDetailsText(double width, double height) {
    return FadeAnimations(
      delay: 0.5,
      child: GestureDetector(
        onTap: _toggleMoreDetails,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            _isExpanded ? "LESS DETAILS" : "MORE DETAILS",
            style: AppThemes.detailsMoreText,
          ),
        ),
      ),
    );
  }

  Widget _productInfo(double width, double height) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: FadeAnimations(
        delay: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: SizedBox(
            width: width,
            height: _isExpanded ? null : height / 10,
            child: Text(
              "lorem ipsum dolor sit amet, consectetur adipiscing elit. " *
                  (_isExpanded ? 5 : 3),
              style: AppThemes.detailsProductDescriptions,
              overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
              maxLines: _isExpanded ? null : 3,
            ),
          ),
        ),
      ),
    );
  }

  Widget _productNameAndPrice(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: FadeAnimations(
        delay: 0.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.watch.name,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: AppConstantsColor.darkTextColor,
              ),
            ),
            SizedBox(width: size.width * 0.2,),
            Text(
              '\$${widget.watch.price.toStringAsFixed(2)}',
              style: AppThemes.detailsProductPrice,
            ),
          ],
        ),
      ),
    );
  }

  Widget _morePicOfProduct(Size size) {
    return FadeAnimations(
      delay: 0.3,
      child: SizedBox(
        width: size.width,
        height: size.height / 15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            4,
            (index) => index == 3
                ? _playButton(size)
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    child: _roundedImage(size.width, size.height),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _playButton(Size size) {
    return Container(
      padding: const EdgeInsets.all(3),
      width: size.width / 5,
      height: size.height / 11.2,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        image: DecorationImage(
          image: AssetImage(widget.watch.imgAddress),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.grey.withOpacity(1),
            BlendMode.darken,
          ),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Icon(
          Icons.play_circle_fill,
          color: AppConstantsColor.lightTextColor,
          size: 30,
        ),
      ),
    );
  }

  Widget _roundedImage(double width, double height) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: width / 5,
      height: height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.grey[300],
      ),
      child: Image(
        image: AssetImage(widget.watch.imgAddress),
      ),
    );
  }

  Widget _topProductImageandBag(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height / 2,
      child: Stack(
        children: [
          
          Positioned(
            top: 70,
            left: 50,
            child: Hero(
              tag: widget.isComeFromMoreSection
                  ? widget.watch.name
                  : widget.watch.imgAddress,
              child: SizedBox(
                width: size.width / 1.3,
                height: size.height / 2.2,
                child: Image.asset(widget.watch.imgAddress),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
