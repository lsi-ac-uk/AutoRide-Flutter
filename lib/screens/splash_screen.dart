import 'package:autoride/gen/assets.gen.dart';
import 'package:autoride/res/color_manager.dart';
import 'package:autoride/res/text_style_manager.dart';
import 'package:autoride/screens/set_location.dart';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    goToHome();
  }

  goToHome() async {
    await Future.delayed(const Duration(seconds: 10), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SetLocation()));
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorManager.mainBackGroundColor,
            // Logo Section
            body: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: ColorManager.buttonColor),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(Assets.icons.logo.path),
                    ),
                  ),
                  Text(
                    "AutoRide",
                    style: TextStyleManager.splashScreenMain,
                  ),
                  SizedBox(
                    width: 250,
                    child: Text("The First AI Cab Sharing",
                    textAlign: TextAlign.center,
                    style: TextStyleManager.screenText,),
                  )
                ],
              ),
            )));
  }
}
