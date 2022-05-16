import 'package:flutter/material.dart';
import 'package:oro/utils/enums.dart';

class Util {
  static double getDeviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getDeviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static Widget getProgressBar(context, {int progress = 1, int rest = 1}) =>
      Container(
        height: 2,
        width: Util.getDeviceWidth(context),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              flex: progress,
              child: Container(
                color: Colors.amber[800],
              ),
            ),
            Flexible(
                flex: rest,
                child: Container(
                  color: Colors.grey[400],
                ))
          ],
        ),
      );
  static Widget getCustomButton(String text, BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        width: MediaQuery.of(context).size.width,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Color.fromRGBO(249, 202, 54, 1),
        ),
        child: Center(
            child: Text(text,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.w700))));
  }

  static Widget divider(
      {double width = 16,
      double thickness = 1,
      double indent = 7.5,
      double endIndent = 7.5,
      double height = 31}) {
    return Container(
      height: height,
      child: Center(
        child: VerticalDivider(
          color: Color.fromRGBO(255, 195, 81, 1),
          width: width,
          thickness: thickness,
          indent: indent,
          endIndent: endIndent,
        ),
      ),
    );
  }

  static Widget getCircleAvatar(
      {double radius = 16, Color? borderColor, Color? avatarColor}) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: borderColor ?? Colors.amber[800],
      child: CircleAvatar(
        radius: radius - 1,
        backgroundColor: avatarColor ?? Color.fromRGBO(255, 247, 234, 1),
      ),
    );
  }

  static Widget getCircularImageContainer(String asset) {
    return Container(
      height: 32,
      width: 32,
      child: Image.asset(asset,
          height: double.maxFinite, width: double.maxFinite, fit: BoxFit.cover),
    );
  }

  static Widget oroDivider(
      {int height = 8,
      EdgeInsetsGeometry? margin,
      Enum direction = DividerDirection.LeftToRight}) {
    return Container(
      height: 8,
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: Image.asset(
        direction == DividerDirection.LeftToRight
            ? "assets/images/oroDividerL2F.jpg"
            : "assets/images/oroDividerR2L.jpg",
        height: double.maxFinite,
        width: double.maxFinite,
        fit: BoxFit.cover,
      ),
    );
  }
}
