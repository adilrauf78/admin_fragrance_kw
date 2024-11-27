import 'package:admin_fragrance_kw/constants/colors.dart';
import 'package:admin_fragrance_kw/widgets/layouts/header/header.dart';
import 'package:admin_fragrance_kw/widgets/layouts/sidebars/sidebars.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_Color,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Text('Dashboard',
                  style: TextStyle(
                    color: AppColors.black,
                      fontSize: 24,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
