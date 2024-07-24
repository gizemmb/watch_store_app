
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AppBar(
      elevation: 0,
      title: Image(image: const AssetImage('assets/images/cassy_logo_other.png'),width:width/2),
      backgroundColor:AppConstantsColor.lightColor,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.search,
              size: 25,
              color: AppConstantsColor.appthemeColorOther,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.bell,
              size: 25,
              color: AppConstantsColor.appthemeColorOther,
            )),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(60);
}
