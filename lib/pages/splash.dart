import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/common/asssets.dart';
import 'package:flutter_application_1/pages/welcome.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // 倒數計時
  final duration = 3;
  int number = 3;

  Future<void> _countDown() async {
    // 倒數計時
    number = duration;
    for (int i = 0; i < duration; i++) {
      await Future.delayed(const Duration(seconds: 1), () {
        if (mounted == true) {
          setState(() {
            number--;
          });
        }
      });
      if (number == 0) {
        // 跳轉到登入頁
        print("End");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WelcomePage()),
        );
        // Navigator.pushReplacementNamed(context, "/login");
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _countDown();
  }

  Widget _buildLogo() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // background
        Container(
          // color: Colors.white,
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(48),
          ),
        ),
        // image
        Image.asset(
          AssetsImages.logoPng,
          width: 84,
          height: 80,
        )
      ],
    );
  }

  Text _buildText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        height: 22 / 19,
      ),
    );
  }

  Widget _buildView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          _buildLogo(),
          const SizedBox(height: 24),

          // title
          _buildText("Online Login"),
          const SizedBox(height: 27),

          // times
          _buildText(number > 0 ? "$number" : "Skip")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSplash,
      body: _buildView(context),
    );
  }
}
