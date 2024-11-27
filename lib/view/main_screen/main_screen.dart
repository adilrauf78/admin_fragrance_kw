import 'package:admin_fragrance_kw/responsive/responsive.dart';
import 'package:admin_fragrance_kw/view/dashboard_screen/dashboard_screen.dart';
import 'package:admin_fragrance_kw/widgets/layouts/header/header.dart';
import 'package:admin_fragrance_kw/widgets/layouts/sidebars/sidebars.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _currentScreen = DashboardScreen();

  void _changeScreen(Widget screen) {
    setState(() {
      _currentScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {

    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      drawer: !isDesktop
          ?  SizedBox(
        width: 250,
        child: SideMenu(sideBarSelected: _changeScreen),
      )
          : null,
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop)
              Expanded(
                child: SizedBox(
                  child: SideMenu(sideBarSelected: _changeScreen),
                ),
              ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Header(),
                  Expanded(
                      child: _currentScreen,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}