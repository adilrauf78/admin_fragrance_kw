import 'package:admin_fragrance_kw/constants/colors.dart';
import 'package:admin_fragrance_kw/constants/custom_text.dart';
import 'package:admin_fragrance_kw/responsive/responsive.dart';
import 'package:admin_fragrance_kw/widgets/layouts/sidebars/sidebars.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Header extends StatelessWidget  {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(
              bottom: BorderSide(
                color: AppColors.subColor.withOpacity(.5),
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!Responsive.isDesktop(context))
                InkWell(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: Icon(Iconsax.menu, color: AppColors.black.withOpacity(0.6)),
                ),
              if (!Responsive.isMobile(context))
              SizedBox(
                width: MediaQuery.of(context).size.width*.3,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.search_normal, color: AppColors.black.withOpacity(0.6)),
                    hintText: 'Search anything',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColors.subColor.withOpacity(.5),
                      )
                    ),
                  ),
                ),
              ),

              SizedBox(width: 20),
              Row(
                children: [
                  if (Responsive.isMobile(context))
                  IconButton(
                    icon: Icon(Iconsax.search_normal, color: AppColors.black.withOpacity(0.6)),
                    onPressed: () {},
                  ),
                  SizedBox(width:5),
                  IconButton(
                    icon: Icon(Iconsax.notification, color: AppColors.black.withOpacity(0.7)),
                    onPressed: () {},
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.subColor.withOpacity(0.5),
                  ),
                  SizedBox(width: 10),
                  if (!Responsive.isMobile(context))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SText(
                        text: 'App Admin',
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      SText(
                        text: 'fragrance@gmail.com',
                        color: AppColors.black.withOpacity(0.6),
                        fontSize: 12,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
      );
  }
}
