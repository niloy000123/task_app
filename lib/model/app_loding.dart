import 'package:flutter/material.dart';

import '../component/widgets.dart';
import '../utils/size_config.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
              width: getProportionateScreenWidth(100),
              height: getProportionateScreenWidth(100),
              child: Image.asset('assets/spinner.gif')),
          customText(text: title)
        ],
      ),
    );
  }
}
