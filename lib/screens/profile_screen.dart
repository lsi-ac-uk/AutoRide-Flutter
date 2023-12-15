import 'package:autoride/gen/assets.gen.dart';
import 'package:autoride/res/color_manager.dart';
import 'package:autoride/res/dimension_manager.dart';
import 'package:autoride/res/text_manager.dart';
import 'package:autoride/res/text_style_manager.dart';
import 'package:autoride/screens/customer_support_screen.dart';
import 'package:autoride/screens/setting_screen.dart';
import 'package:autoride/screens/terms_and_conditions.dart';
import 'package:autoride/screens/trip_history_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileCustomerSupport = Icons.support_agent;
  final profileTripHistoryIcon = Icons.dataset;
  final profileSetting = Icons.settings;
  final profileTerms = Icons.gavel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.mainBackGroundColor,
        appBar: AppBar(
          title: Text(
            "AutoRide",
            style: TextStyleManager.appBarText,
          ),
          centerTitle: true,
        ),
        // Drawer Builder
        //drawer: buildDrawer(),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(DimensionManager.large),
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      Assets.images.profile.path,
                      height: 117,
                      width: 117,
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  height: 15,
                ),
                Text(TextManager.userName, style: TextStyleManager.buttonText),
                // Customer support
                const SizedBox(
                  height: 30,
                ),
                buildRow(
                  profileCustomerSupport,
                  TextManager.proSupport,
                  const CustomerSupport()

                ),
                // History
                const SizedBox(
                  height: 30,
                ),
                buildRow(
                  profileTripHistoryIcon,
                  TextManager.proTripHistory,
                    const TripHistory()
                ),
                // Setting
                const SizedBox(
                  height: 30,
                ),
                buildRow(
                  profileSetting,
                  TextManager.proSetting,
                   const Setting()

                ),
                // Terms
                const SizedBox(
                  height: 30,
                ),
                buildRow(
                  profileTerms,
                  TextManager.proTerms,
                  const TermsAndConditionsScreen()
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset(Assets.icons.folders.path).image,
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  GestureDetector buildRow(IconData profileIcon, String text, pageClass) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => pageClass));
      },
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: ColorManager.buttonColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              profileIcon,
              size: DimensionManager.profileIcons,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(text, style: TextStyleManager.textFieldCaption)
        ],
      ),
    );
  }
}
