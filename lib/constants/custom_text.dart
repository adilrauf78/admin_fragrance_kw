import 'package:admin_fragrance_kw/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HText extends StatelessWidget {
  final String text ;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  const HText({super.key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
              fontSize: fontSize ?? 20..sp,
              fontWeight: fontWeight?? FontWeight.w700,
              color: color?? AppColors.black,
              overflow: TextOverflow.fade
          )
    );
  }
}
class SText extends StatelessWidget {
  final String text ;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  const SText({super.key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
              fontSize: fontSize ?? 13..sp,
              fontWeight: fontWeight?? FontWeight.w400,
              color: color?? AppColors.subColor,
              overflow: TextOverflow.fade
          )
    );
  }
}
