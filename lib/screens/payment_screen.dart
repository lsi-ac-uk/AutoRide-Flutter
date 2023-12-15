import 'package:autoride/res/dimension_manager.dart';
import 'package:autoride/screens/payment_message_screen.dart';
import 'package:flutter/material.dart';

import '../res/color_manager.dart';
import '../res/text_manager.dart';
import '../res/text_style_manager.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  final securityController = TextEditingController();
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    securityController.dispose();
    super.dispose();
  }
  final filedSearchIcon = Icons.search;
  final filedCardIcon = Icons.credit_card;
  final filedDateIcon = Icons.calendar_month;
  final fileSecurity = Icons.security;

  final filedAddress = Icons.place;
  final filedCity = Icons.home;
  final filedZipCode = Icons.code;
  final filedCountry = Icons.flag;
  final filedState = Icons.place_rounded;
  
  static const String acceptPayment = "123";
  bool successSign = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(DimensionManager.medium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                TextManager.paymentTitle,
                style: TextStyleManager.titleText,
              ),
              const SizedBox(
                height: 10,
              ),
              textFieldTitle("Name On Card"),
              SizedBox(
                  height: 50,
                  child: textFiledBuilder(TextManager.userName, filedSearchIcon)),
              const SizedBox(
                height: 10,
              ),
              textFieldTitle("Credit Card Number"),
              SizedBox(
                  height: 50,
                  child: textFiledBuilder(
                      TextManager.paymentCreditHint, filedCardIcon)),
              const SizedBox(
                height: 10,
              ),

              // Data and Security code section.

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Date
            Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      TextManager.paymentDateTitle,
                      style: TextStyleManager.textFieldTitle,
                      textAlign: TextAlign.left,
                    )),
                SizedBox(
                  width: 150,
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(DimensionManager.medium),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(filedDateIcon, color: Colors.black),
                          hintText: TextManager.paymentDateHint,
                          hintStyle: TextStyleManager.textFieldCaption),
                    ),
                  ),
                ),
              ],
            ),
            // Security
            Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      TextManager.paymentStateTitle,
                      style: TextStyleManager.textFieldTitle,
                      textAlign: TextAlign.left,
                    )),
                SizedBox(
                  width: 150,
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      controller: securityController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(DimensionManager.medium),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(fileSecurity, color: Colors.black),
                          hintText: TextManager.paymentSecurityHint,
                          hintStyle: TextStyleManager.textFieldCaption),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
              const SizedBox(
                height: 10,
              ),

              // Address Section.
              textFieldTitle(TextManager.paymentStreetAddressTitle),
              SizedBox(
                  height: 50,
                  child: textFiledBuilder(
                      TextManager.paymentStreetAddressHint, filedAddress)),
              const SizedBox(
                height: 10,
              ),

              // Data and Security code section.
              rowSectionBuilder(
                TextManager.paymentCityHint,
                TextManager.paymentStateHint,
                filedCity,
                filedState,
                TextManager.paymentCityTitle,
                TextManager.paymentStateTitle,
              ),
              const SizedBox(
                height: 10,
              ),
              rowSectionBuilder(
                TextManager.paymentZipCodeHint,
                TextManager.paymentCountryHint,
                filedCountry,
                filedZipCode,
                TextManager.paymentCountryTitle,
                TextManager.paymentZipCodeTitle,
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 52,
                    width: 158,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: ColorManager.buttonColor,
                        textStyle: const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      onPressed: () {
                        print('Pressed');
                      },
                      child: const Text('Cancel'),
                    ),
                  ),

                  SizedBox(
                    height: 52,
                    width: 158,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: ColorManager.buttonColor,
                        textStyle: const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      onPressed: () {
                        if (securityController.text == acceptPayment) {
                          successSign = true;
                        }
                          Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentMessageScreen(),
                        settings: RouteSettings(
                        arguments: successSign,)
                          ));

                      },
                      child: const Text('Continue'),
                    ),
                  )
                ],
              )
          ],
        ),
      ),
    ),
            )));
  }

  Widget textFieldTitle(String titleName) {
    return Align(
        alignment: Alignment.topLeft,
        child: Text(
          titleName,
          style: TextStyleManager.textFieldTitle,
          textAlign: TextAlign.left,
        ));
  }

  Widget textFiledBuilder(String hitText, IconData filedIcon) {
    return SizedBox(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DimensionManager.medium),
              borderSide: const BorderSide(color: Colors.black),
            ),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(filedIcon, color: Colors.black),
            hintText: hitText,
            hintStyle: TextStyleManager.textFieldCaption),
      ),
    );
  }

  Widget rowSectionBuilder(
      String hitTextOne,
      String hitTextTwo,
      IconData filedIconOne,
      IconData filedIconTwo,
      String titleNameOne,
      String titleNameTwo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Date
        Column(
          children: [
            textFieldTitle(titleNameOne),
            SizedBox(
              width: 150,
              child: textFiledBuilder(hitTextOne, filedIconOne),
            ),
          ],
        ),
        // Security
        Column(
          children: [
            textFieldTitle(titleNameTwo),
            SizedBox(
                width: 150, child: textFiledBuilder(hitTextTwo, filedIconTwo)),
          ],
        ),
      ],
    );
  }
}
