import 'package:flutter/material.dart';

//시작 화면
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
     Navigator.pushReplacementNamed(context, '/main');
    },);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/user.png',
              width: 180,
              height: 180,
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Text(
                'Business Card',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}