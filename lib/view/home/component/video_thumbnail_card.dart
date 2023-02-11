import 'package:flutter/material.dart';
import 'package:task_app/component/widgets.dart';
import 'package:task_app/view/home/component/image_card.dart';
import 'package:task_app/view/home/component/video_card.dart';
import 'package:task_app/view_model/home_view_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

class VideoThumbnailCard extends StatelessWidget {
  const VideoThumbnailCard({
    Key? key,
    this.press,
    required this.index,
    required this.homeProvider,
  }) : super(key: key);

  final VoidCallback? press;
  final HomeViewModel homeProvider;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin:
            EdgeInsets.only(bottom: getProportionateScreenWidth(PADING_M_SIZE)),
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(PADING_S_SIZE),
            vertical: getProportionateScreenWidth(PADING_M_SIZE)),
        decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.circular(
                getProportionateScreenWidth(PADING_M_SIZE))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //video main card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(PADING_S_SIZE)),
              ),
              elevation: 2,
              child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      getProportionateScreenWidth(PADING_S_SIZE)),
                  child: homeProvider.currentVideoPlayed == index
                      ?
                      // video player contaier
                      VideoCard(
                          image: homeProvider.productList![index].videoUrl
                              .toString())
                      :
                      // videos thumbnail container
                      ImageCard(
                          index: index,
                          image: homeProvider.productList![index].videoUrl
                              .toString()),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(PADING_S_SIZE),
            ),
            customText(
                textAlign: TextAlign.left,
                text:
                    "Caption : ${homeProvider.productList![index].caption.toString()}")
          ],
        ),
      ),
    );
  }
}
