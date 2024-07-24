import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:watches_app/animations/fade_animations.dart';
import 'package:watches_app/navigator.dart';
import 'package:watches_app/utils/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        decoration: const BoxDecoration(
          color: AppConstantsColor.lightColor
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimations(
                      delay: 1,
                      child: Image(
                        image: const AssetImage(
                          'assets/images/cassy_logo.png',
                        ),
                        width: width / 1,
                        height: height / 6,
                      ),
                      ),
                ],
              ),
            ),
            SizedBox(height: height * 0.01),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: height * 0.05),
                      FadeAnimations(
                          delay: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: AppConstantsColor.appthemeColor,
                                      blurRadius: 40,
                                      offset: Offset(10, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        hintText:
                                            "Enter your email or phone number",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: const TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      const FadeAnimations(
                          delay: 1,
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(
                                color: AppConstantsColor.appthemeColorOther),
                          )),
                      SizedBox(height: height * 0.02),
                      FadeAnimations(
                          delay: 1,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MainNavigator()));
                            },
                            height: height * 0.05,
                            color: AppConstantsColor.appthemeColorOther,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: AppConstantsColor.appthemeColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      FadeAnimations(
                          delay: 1,
                          child: MaterialButton(
                            onPressed: () {},
                            height: height * 0.05,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            color: AppConstantsColor.appthemeColorOther,
                            child: const Center(
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50.0),
                        child: FadeAnimations(
                          delay: 1,
                          child: Lottie.asset(
                              'assets/animationss/welcome_animation.json',
                              width: width / 0.5,
                              height: height * 0.01,
                              fit: BoxFit.cover),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
