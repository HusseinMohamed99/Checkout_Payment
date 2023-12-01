import 'package:checkout_payment/Core/theming/styles.dart';
import 'package:checkout_payment/Core/utils/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    leading: Center(
      child: SvgPicture.asset(
        Assets.svgsArrow,
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
  );
}
