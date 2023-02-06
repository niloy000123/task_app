import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/size_config.dart';

Text customText(
    {required String text,
    Color color = kTextColor,
    double fontSize = 13,
    TextAlign textAlign = TextAlign.center,
    FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontSize: getProportionateScreenWidth(fontSize),
    ),
  );
}

Widget custoButton(String text) {
  return ElevatedButton(
      onPressed: () {},
      child: SizedBox(
          width: double.infinity,
          child: Text(
            text,
            textAlign: TextAlign.center,
          )));
}

Widget errorWidget(String text) {
  return Center(
      child: Padding(
    padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(PADING_2XL_SIZE)),
    child: customText(text: text, color: kPrimaryOrange),
  ));
}
