import 'package:admin_fragrance_kw/constants/button1.dart';
import 'package:admin_fragrance_kw/constants/colors.dart';
import 'package:admin_fragrance_kw/constants/custom_text.dart';
import 'package:admin_fragrance_kw/view/dashboard_screen/dashboard_screen.dart';
import 'package:admin_fragrance_kw/view/main_screen/main_screen.dart';
import 'package:admin_fragrance_kw/widgets/layouts/sidebars/sidebars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_Color,
      body: Center(
        child: SizedBox(
          width: 450,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: 55,
                right: 25,
                left: 25,
                bottom: 30,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20..r),
                border: Border.all(
                    color: AppColors.border_Color
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset('assets/images/logo.png',
                      height: 36..h,
                      width: 246..w,
                    ),
                  ),
                  SizedBox(height: 25..h),
                  HText(text: 'Sign In'),
                  SText(
                      text: 'Enter your email and password to sign in'),
                  SizedBox(height: 20
                    ..h,),
                  SText(text: 'Email',
                    fontSize: 15,
                    color: AppColors.black.withOpacity(.6),
                  ),
                  SizedBox(height: 10
                    ..h,),
                  SizedBox(
                    width: double.infinity,
                    height: 50..h,
                    child: TextField(
                      cursorColor: AppColors.black.withOpacity(.5),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10..r),
                              borderSide: BorderSide(
                                color: Color(0xFFEEEEEE),
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10..r),
                              borderSide: BorderSide(
                                color: Color(0xFFEEEEEE),
                              )
                          ),
                          contentPadding: EdgeInsets.zero,
                          fillColor: AppColors.white,
                          filled: true,
                          prefixIcon: Transform.scale(
                            scale: 0.45,
                            child: SvgPicture.asset(
                                'assets/svgIcons/email.svg'),
                          ),
                          hintText: 'dummy@email.com',
                          hintStyle: TextStyle(
                            color: AppColors.black.withOpacity(.3),
                            fontSize: 15..sp,
                            fontWeight: FontWeight.w400,
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 20
                    ..h,),
                  SText(text: 'Password',
                    fontSize: 15,
                    color: AppColors.black.withOpacity(.6),
                  ),
                  SizedBox(height: 10
                    ..h,),
                  SizedBox(
                    height: 50
                      ..h,
                    width: double.infinity,
                    child: TextField(
                      cursorColor: AppColors.black.withOpacity(.5),
                      obscureText: hidden,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10
                              ..r),
                            borderSide: BorderSide(
                              color: Color(0xFFEEEEEE),
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10
                              ..r),
                            borderSide: BorderSide(
                              color: Color(0xFFEEEEEE),
                            )
                        ),
                        contentPadding: EdgeInsets.zero,
                        fillColor: AppColors.white,
                        filled: true,
                        prefixIcon: Transform.scale(
                            scale: 0.5,
                            child: SvgPicture.asset(
                                'assets/svgIcons/lock.svg')),
                        hintStyle: TextStyle(
                                fontSize: 15
                                  ..sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.subColor
                            ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            // Toggle the password visibility
                            setState(() {
                              hidden = !hidden;
                            });
                          },
                          child: Icon(
                            hidden ? Icons.visibility_off : Icons
                                .visibility,
                            color: Color(0xFF9FA3A8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40
                    ..h,),
                  SizedBox(
                      width: double.infinity,
                      height:50,
                      child: ElevatedButton(
                          onPressed: (){
                            Get.to(MainScreen());
                          },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: AppColors.blue
                        ),
                          child: Text('Sign In',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                          ),
                      ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
