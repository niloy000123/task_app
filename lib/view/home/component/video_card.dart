import 'package:flutter/material.dart';
import 'package:task_app/view/home/component/product_image.dart';
import '../../../model/product.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    Key? key,
    this.product,
    this.press,
  }) : super(key: key);

  final ProductModel? product;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(
        elevation: 2,
        child: Container(
          width: double.infinity,
          // height: getProportionateScreenWidth(PADING_2XL_SIZE * 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                getProportionateScreenWidth(PADING_S_SIZE)),
          ),
          child: Column(
            children: [
              ImageCard(image: product!.videoUrl!),
            ],
          ),
        ),
      ),
    );
  }
}
