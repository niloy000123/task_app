import 'package:flutter/material.dart';
import 'package:task_app/view/home/component/image_card.dart';
import 'package:task_app/view/home/component/video_card.dart';
import 'package:task_app/view_model/home_view_model.dart';
import '../../../model/product.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

class VideoThamCard extends StatelessWidget {
  const VideoThamCard({
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
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(getProportionateScreenWidth(PADING_S_SIZE)),
        ),
        elevation: 2,
        child: SizedBox(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
                getProportionateScreenWidth(PADING_S_SIZE)),
            child: Column(
              children: [
                homeProvider.currentVideoPlayed == index
                    ? VideoCard(
                        image: homeProvider.productList![index].videoUrl
                            .toString())
                    : ImageCard(
                        index: index,
                        image: homeProvider.productList![index].videoUrl
                            .toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
