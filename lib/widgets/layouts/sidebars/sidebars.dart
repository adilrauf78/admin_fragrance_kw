import 'package:admin_fragrance_kw/constants/colors.dart';
import 'package:admin_fragrance_kw/constants/custom_text.dart';
import 'package:admin_fragrance_kw/view/categories/categories.dart';
import 'package:admin_fragrance_kw/view/dashboard_screen/dashboard_screen.dart';
import 'package:admin_fragrance_kw/view/products/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SideMenu extends StatefulWidget {
  final Function(Widget) sideBarSelected;
  const SideMenu({super.key, required this.sideBarSelected});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int _currentIndex = 0;
  int _hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: BeveledRectangleBorder(),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(
              right: BorderSide(
                color: AppColors.subColor.withOpacity(.5),
                width: 1,
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.offAllNamed('/');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      height: 100,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SText(
                        text: 'Menu',
                        color: AppColors.black.withOpacity(.5),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      SizedBox(height: 5),
                      MenuItem(
                        index: 0,
                        icon: Iconsax.status,
                        label: 'Dashboard',
                        onTap: () {
                          setState(() {
                            _currentIndex = 0;
                          });
                          widget.sideBarSelected(DashboardScreen());
                        },
                      ),
                      SizedBox(height: 10),
                      MenuItem(
                        index: 1,
                        icon: Iconsax.image,
                        label: 'Media',
                        onTap: () {
                          setState(() {
                            _currentIndex = 1;
                          });
                          Get.toNamed('/media');
                        },
                      ),
                      SizedBox(height: 10),
                      MenuItem(
                        index: 2,
                        icon: Iconsax.picture_frame,
                        label: 'Banners',
                        onTap: () {
                          setState(() {
                            _currentIndex = 2;
                          });
                          Get.toNamed('/banners');
                        },
                      ),
                      SizedBox(height: 10),
                      MenuItem(
                        index: 3,
                        icon: Iconsax.category,
                        label: 'Categories',
                        onTap: () {
                          setState(() {
                            _currentIndex = 3;
                          });
                          widget.sideBarSelected(Categories());
                        },
                      ),
                      SizedBox(height: 10),
                      MenuItem(
                        index: 4,
                        icon: Iconsax.shopping_bag,
                        label: 'Products',
                        onTap: () {
                          setState(() {
                            _currentIndex = 4;
                          });
                          widget.sideBarSelected(Products());
                        },
                      ),
                      SizedBox(height: 10),
                      SText(
                        text: 'Others',
                        color: AppColors.black.withOpacity(.5),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      SizedBox(height: 5),
                      MenuItem(
                        index: 5,
                        icon: Iconsax.user,
                        label: 'Profile',
                        onTap: () {
                          setState(() {
                            _currentIndex = 5;
                          });
                          Get.toNamed('/profile');
                        },
                      ),
                      SizedBox(height: 10),
                      MenuItem(
                        index: 6,
                        icon: Iconsax.setting_2,
                        label: 'Settings',
                        onTap: () {
                          setState(() {
                            _currentIndex = 6;
                          });
                          Get.toNamed('/settings');
                        },
                      ),
                      SizedBox(height: 10),
                      MenuItem(
                        index: 7,
                        icon: Iconsax.logout,
                        label: 'Logout',
                        onTap: () {
                          setState(() {
                            _currentIndex = 7;
                          });
                          Get.offAllNamed('/login');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MenuItem({
    required int index,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hoveredIndex = index;
        });
      },
      onExit: (_) {
        setState(() {
          _hoveredIndex = -1;
        });
      },
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: _currentIndex == index
                ? AppColors.blue
                : _hoveredIndex == index
                ? AppColors.blue.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                  left: 24,
                  bottom: 15,
                  top: 15,
                ),
                child: Icon(
                  icon,
                  color: _currentIndex == index
                      ? AppColors.white
                      : _hoveredIndex == index
                      ? AppColors.blue
                      : AppColors.black.withOpacity(.5),
                ),
              ),
              SText(
                text: label,
                color: _currentIndex == index
                    ? AppColors.white
                    : _hoveredIndex == index
                    ? AppColors.blue
                    : AppColors.black.withOpacity(.5),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
