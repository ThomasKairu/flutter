import 'package:angel_fetus/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  

  static Widget builder(BuildContext context) {
    return const SplashScreen();
  }

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboardingPage();
  }

  void _navigateToOnboardingPage() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.initialRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFBFBC),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/img_fetus_inside_he.png',
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            const SizedBox(height: 20),
            Text(
              'Angel',
              style: TextStyle(
                color: const Color(0xFFFFFFFF),
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontWeight: FontWeight.bold,
                fontFamily: 'Public Sans',
              ),
            ),
            Text(
              'Fetus',
              style: TextStyle(
                color: const Color(0xFFF4716A),
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontWeight: FontWeight.bold,
                fontFamily: 'Public Sans',
              ),
            ),
          ],
        ),
      ),
    );
  }
}