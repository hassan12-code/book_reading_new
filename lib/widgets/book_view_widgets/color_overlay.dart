import 'package:book_reading/utils/utils.dart';
import 'package:flutter/material.dart';

class ColorOverlay extends StatelessWidget {
  const ColorOverlay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.45,
      width: screenWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        color: Colors.white.withOpacity(0.7),
      ),
    );
  }
}
