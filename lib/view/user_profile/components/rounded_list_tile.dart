import 'package:flutter/material.dart';
import '../../../theme/custom_app_theme.dart';
import '../../../utils/constants.dart';

class RoundedListTile extends StatelessWidget {
  const RoundedListTile(
      {super.key,
      required this.leadingBackColor,
      required this.icon,
      required this.title,});
  final Color? leadingBackColor;
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: 70,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: leadingBackColor,
              radius: 25,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    icon,
                    color: AppConstantsColor.lightTextColor,
                  )),
            ),
            title: Text(title,style: AppThemes.profileRepeatedListTileTitle,),
          ),
        ),
      ),
    );
  }
}
