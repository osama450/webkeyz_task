import 'package:flutter/material.dart';
import 'package:webkeyz_task/layouts/main/widgets/BottomNavigationBar.dart';
import 'package:webkeyz_task/shared/config/colors.dart';
import '../../modules/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: selectedIndex,
      ),
      body: Center(
        child: screens[selectedIndex],
      ),
    );
  }
}
