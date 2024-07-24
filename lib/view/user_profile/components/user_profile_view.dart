import 'package:flutter/material.dart';
import 'package:watches_app/view/log/login.dart';
import '../../../animations/fade_animations.dart';
import '../../../theme/custom_app_theme.dart';
import '../../../utils/constants.dart';
import 'appbar.dart';
import 'rounded_list_tile.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: const UserViewAppbar(),
        body: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _topUserInfo(width),
                SizedBox(
                  height: height * 0.05,
                ),
                _roundedLists(width, height),
                FadeAnimations(
                    delay: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "My Account",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color:AppConstantsColor.appthemeColorOther,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>const LoginPage()));
                          },
                          child: Text(
                            "Switch to Other Account",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.blue[600],
                                fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        GestureDetector(
                          onTap: () {
                           Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>const LoginPage()));

                          },
                          child: Text(
                            "Log Out",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.red[500],
                                fontSize: 18),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _roundedLists(double width, double height) {
    return FadeAnimations(
      delay: 1,
      child: SizedBox(
        width: width,
        height: height / 2.9,
        child: Column(
          children: [
            const RoundedListTile(
              leadingBackColor: AppConstantsColor.appthemeColorOther,
              icon: Icons.wallet_travel_outlined,
              title: "Orders",
            ),
            SizedBox(
              height: height * 0.0,
            ),
            const RoundedListTile(
              leadingBackColor: AppConstantsColor.appthemeColorOther,
              icon: Icons.campaign_rounded,
              title: "Campaigns",
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const RoundedListTile(
              leadingBackColor: AppConstantsColor.appthemeColorOther,
              icon: Icons.call,
              title: "Contact",
            )
          ],
        ),
      ),
    );
  }

  Widget _topUserInfo(double width) {
    return FadeAnimations(
      delay: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            
            radius:60,
            backgroundImage: AssetImage('assets/images/avatar_profile.jpeg'),
          ),
          SizedBox(
            width: width * 0.05,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Gizem Beden",
                style: AppThemes.profileDevName,
              ),
              SizedBox(
                height: 2,
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit_outlined,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
