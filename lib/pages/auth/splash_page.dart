import 'package:flutter/cupertino.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/ic_launcher-playstore.png',
      fit: BoxFit.cover,
    );
  }
}
