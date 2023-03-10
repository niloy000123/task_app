import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:task_app/utils/size_config.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../../../utils/constants.dart';
import '../../../view_model/home_view_model.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({
    Key? key,
    required this.image,
    required this.index,
  }) : super(key: key);

  final String image;
  final int index;

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  dynamic _thumbnailImage;
  @override
  void initState() {
    super.initState();
    generateThumbnail();
  }

  generateThumbnail() async {
    try {
      await VideoThumbnail.thumbnailFile(
        video: widget.image.toString(),
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.WEBP,
        maxHeight: 64,
        quality: 75,
      ).then((v) {
        setState(() {
          _thumbnailImage = v;
        });
      });
    } catch (e) {
      setState(() {
        _thumbnailImage = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeProvider = Provider.of<HomeViewModel>(context);

    return Container(
      width: double.infinity,
      height: getProportionateScreenWidth(PADING_2XL_SIZE * 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(PADING_M_SIZE))),
      child: Stack(
        children: [
          _thumbnailImage == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : _thumbnailImage is String
                  ? // Thumbnail load
                  Image.file(
                      File(_thumbnailImage),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    )
                  : // if Thumbnail can not genarate set default image as thumnales.
                  Image.asset(
                      'assets/images/image_default.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
          GestureDetector(
            onTap: () {
              //set video play
              homeProvider.setCurrentVideoPlayed(widget.index);
            },
            child: Center(
              child: Icon(
                Icons.play_circle_fill_outlined,
                size: getProportionateScreenWidth(PADING_2XL_SIZE * 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
