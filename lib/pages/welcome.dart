import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/asssets.dart';

import '../common/button.dart';
import 'login.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  Padding _buildText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 38),
      child: Text(
        "Welcome to Flutter",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xff2B2A2A),
          height: 23 / 20,
        ),
      ),
    );
  }

  Widget _buildBtns(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // skip
          TextButton(
              onPressed: () {},
              child: const Text(
                "Skip",
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff2B2A2A),
                    fontWeight: FontWeight.w300),
              )),
          // get Start
          ButtonWidget(
            text: "Get Start",
            width: 139,
            height: 42,
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              )
            },
          )
        ],
      ),
    );
  }

  Widget _buildView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 標題
        _buildText(),
        const SizedBox(height: 70),

        // image
        Image.asset(
          AssetsImages.welcomePng,
          height: 409,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(height: 72),

        // btn
        _buildBtns(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: _buildView(context),
    ));
  }
}
