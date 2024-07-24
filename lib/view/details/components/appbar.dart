import 'package:flutter/material.dart';
import '../../../theme/custom_app_theme.dart';
import '../../../utils/constants.dart';

class CustomDetailsViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomDetailsViewAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppConstantsColor.lightColor,
      centerTitle: true,
      title: Text(
        title,
        style: AppThemes.detailsAppBar,
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back,
          color: AppConstantsColor.appthemeColorOther,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border,
            color: AppConstantsColor.appthemeColorOther,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(53);
}
