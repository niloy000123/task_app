import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_app/view/home/component/video_card.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../../../component/widgets.dart';
import '../../../model/app_loding.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import '../../../view_model/home_view_model.dart';

class VideosList extends StatelessWidget {
  const VideosList({
    Key? key,
    this.homeProvider,
  }) : super(key: key);

  final HomeViewModel? homeProvider;

  @override
  Widget build(BuildContext context) {
    if (homeProvider!.loading) {
      return const AppLoading(
        title: 'Videos Loading...',
      );
    }
    if (homeProvider!.productError != null) {
      return errorWidget(homeProvider!.productError!.message.toString());
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(
            text: "Videos",
            fontSize: getProportionateScreenWidth(FONT_L),
            fontWeight: FontWeight.bold),
        ...List.generate(
            homeProvider!.productList!.length,
            (index) => VideoCard(
                  product: homeProvider!.productList![index],
                  press: () {},
                )),
        SizedBox(
          height: getProportionateScreenWidth(PADING_M_SIZE),
        ),
      ],
    );
  }
}
