import 'package:flutter/material.dart';
import 'package:task_app/view/home/component/video_tham_card.dart';
import '../../../component/widgets.dart';
import '../../../model/app_loding.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import '../../../view_model/home_view_model.dart';

class VideosList extends StatelessWidget {
  const VideosList({
    Key? key,
    required this.homeProvider,
  }) : super(key: key);

  final HomeViewModel homeProvider;

  @override
  Widget build(BuildContext context) {
    //loading whern fetching data
    if (homeProvider.loading) {
      return const AppLoading(
        title: 'Videos are Loading...',
      );
    }
    //error whern problem on fetching data
    if (homeProvider.videoError != null) {
      return errorWidget(homeProvider.videoError!.message.toString());
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(
            text: "Videos",
            fontSize: getProportionateScreenWidth(FONT_L),
            fontWeight: FontWeight.bold),
        // here all the video are genarated...
        ...List.generate(
            homeProvider.productList!.length,
            (index) => VideoThamCard(
                  homeProvider: homeProvider,
                  index: index,
                  press: () {
                    homeProvider.setCurrentVideoPlayed(index);
                  },
                )),
        SizedBox(
          height: getProportionateScreenWidth(PADING_M_SIZE),
        ),
      ],
    );
  }
}
