import 'package:cooking_champs/constant/my_color.dart';
import 'package:flutter/material.dart';

lightTextStyle({required fontSize, required color, latterSpace,height,overflow}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      letterSpacing: 0.2,
      height: 1.5,
      overflow: overflow,
      fontWeight: FontWeight.w300,
      fontFamily:Fonts.beVietnamProLight );
}

regularNormalTextStyle({required fontSize, required color, latterSpace,height,overflow}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      overflow: overflow,
      letterSpacing: 0.4,
      height: 1.5,
      fontWeight: FontWeight.w300,
      fontFamily:Fonts.beVietnamProLight );
}

regularNormalTextStyleWithoutHeight({required fontSize, required color, latterSpace,height,overflow}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      overflow: overflow,
      letterSpacing: 0.2,
      fontWeight: FontWeight.w300,
      fontFamily:Fonts.beVietnamProExtraLight);
}

regularTextStyle({required fontSize, required color, height,overflow}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      overflow: overflow,
      letterSpacing: 0.2,
      height: 1.4,
      fontWeight: FontWeight.w400,
      fontFamily:Fonts.beVietnamProRegular);
}

mediumTextStyle({required fontSize, required color, height,overflow}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      overflow: overflow,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.2,
      height: 1.5,
      fontFamily: Fonts.beVietnamProMedium);
}

semiBoldTextStyle({required fontSize, required color, height,overflow}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      overflow: overflow,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.2,
      height: 1.5,
      fontFamily:Fonts.beVietnamProSemiBold);
}

boldTextStyle({required fontSize, required color, height, latterSpace,overflow}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    overflow: overflow,
    fontWeight: FontWeight.w700,
    fontFamily: Fonts.beVietnamProBold,
    letterSpacing: 0.2,
    height: 1.5,
    //   letterSpacing: latterSpace,
  );
}

boldMaxLiseTextStyle({required fontSize, required color, height, latterSpace,var overflow}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    overflow: overflow,
    fontWeight: FontWeight.w700,
    fontFamily:Fonts.beVietnamProBold,
    letterSpacing: 0.2,
    height: 1.5,
    // letterSpacing: latterSpace
  );
}

appBarTextStyle({fontSize, required color, height}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w500,
      height: height,
      fontFamily:Fonts.beVietnamProBold);


}