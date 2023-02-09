import 'package:flutter/material.dart';
import 'package:task_app/view/home/component/body.dart';
import '../../utils/constants.dart';
import '../../utils/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      //custom appbar
      appBar: homeAppbar(),
      body: const Body(),
    );
  }

  AppBar homeAppbar() {
    return AppBar(
      title: Text(
        'M360ICT',
        style: TextStyle(
            color: kPrimaryColor,
            fontSize: getProportionateScreenWidth(FONT_L),
            fontWeight: FontWeight.w900,
            letterSpacing: 1),
      ),
    );
  }
}
