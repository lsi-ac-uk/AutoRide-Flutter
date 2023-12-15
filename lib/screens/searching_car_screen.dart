import 'package:autoride/gen/assets.gen.dart';
import 'package:autoride/res/color_manager.dart';
import 'package:autoride/res/text_style_manager.dart';
import 'package:autoride/screens/go_to_destination.dart';
import 'package:flutter/material.dart';

class SearchingCarScreen extends StatefulWidget {
  const SearchingCarScreen({super.key});

  @override
  State<SearchingCarScreen> createState() => _SearchingCarScreenState();
}

class _SearchingCarScreenState extends State<SearchingCarScreen> {
  @override
  void initState() {
    super.initState();
    goToHome();
  }

  goToHome() async {
    await Future.delayed(const Duration(seconds: 10), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) =>  const GoToDesination()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorManager.mainBackGroundColor,
            body: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(
                          Assets.icons.car.path,
                          height: 250,
                          width: 250,
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Text(
                          "Searching for the nearest car",
                          textAlign: TextAlign.center,
                          style: TextStyleManager.screenText,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SizedBox(
                    height: 52,
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: ColorManager.buttonColor,
                        textStyle:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GoToDesination()));
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
