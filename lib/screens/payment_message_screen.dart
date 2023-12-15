import 'package:autoride/screens/go_to_destination.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../res/color_manager.dart';
import '../res/text_style_manager.dart';

class PaymentMessageScreen extends StatefulWidget {
  const PaymentMessageScreen({super.key});

  @override
  State<PaymentMessageScreen> createState() => _PaymentMessageScreenState();
}

class _PaymentMessageScreenState extends State<PaymentMessageScreen> {

 var messageTogo;

  @override
  void initState() {
    super.initState();
    backToHome();
  }

  backToHome() async {
    await Future.delayed(const Duration(seconds: 10), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const GoToDesination(),
        settings: RouteSettings(
          arguments: messageTogo,)
    ));
  }

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments;
    setState(() {
      messageTogo = message;
    });

    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorManager.mainBackGroundColor,
            // Logo Section
            body: SizedBox(
              width: double.infinity,
              child: Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(
                          Assets.icons.wallet.path,
                          color: message == true ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                    Text(
                      message == true ? "Successful!" : "Failed!",
                      style: TextStyleManager.splashScreenMain,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 350,
                      child: Text(
                        "You will be automatically redirected to the software.",
                        textAlign: TextAlign.center,
                        style: TextStyleManager.screenText,
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
