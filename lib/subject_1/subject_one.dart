import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:belinda_freitas_examen/constants.dart';
import 'package:belinda_freitas_examen/subject_1/screens/dashboard.dart';

class SubjectOne extends StatefulWidget {
  const SubjectOne({super.key});

  @override
  State<SubjectOne> createState() => _SubjectOneState();
}

class _SubjectOneState extends State<SubjectOne> {
  final PageController _pageController = PageController();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f9),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [
          DashboardScreen(),
          Center(child: Icon(CupertinoIcons.waveform_path_ecg)),
          Center(child: Icon(CupertinoIcons.bubble_left_bubble_right_fill)),
          Center(child: Icon(Icons.menu)),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) {
          setState(() => _index = value);
          _pageController.animateToPage(value, duration: const Duration(milliseconds: 350), curve: Curves.linear);
        },
        height: 60,
        indicatorColor: transparent,
        shadowColor: shadowColor,
        surfaceTintColor: white,
        animationDuration: const Duration(milliseconds: 350),
        destinations: const [
          NavigationDestination(
            icon: Icon(CupertinoIcons.circle_grid_3x3_fill),
            selectedIcon: Icon(CupertinoIcons.circle_grid_3x3_fill, color: red),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.waveform_path_ecg),
            selectedIcon: Icon(CupertinoIcons.waveform_path_ecg, color: red),
            label: 'Around Me',
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.bubble_left_bubble_right_fill),
            selectedIcon: Icon(CupertinoIcons.bubble_left_bubble_right_fill, color: red),
            label: 'Messaging',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu),
            selectedIcon: Icon(Icons.menu, color: red),
            label: 'Main Menu',
          ),
        ],
      ),
    );
  }
}
