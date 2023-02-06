import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/view/home/component/videos_list.dart';
import '../../../component/widgets.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import '../../../view_model/home_view_model.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeProvider = Provider.of<HomeViewModel>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(PADING_L_SIZE)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                  color: kPrimaryOrange,
                  fontSize: getProportionateScreenWidth(FONT_L),
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1),
            ),
            customText(
                text: ' To Our Store',
                fontSize: getProportionateScreenWidth(FONT_XS)),
            SizedBox(
              height: getProportionateScreenWidth(PADING_2XL_SIZE),
            ),
            VideosList(
              homeProvider: homeProvider,
            ),
          ],
        ),
      ),
    );
  }
}
