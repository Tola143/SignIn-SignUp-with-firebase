import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomGNav extends StatefulWidget {
  const BottomGNav({super.key});

  @override
  State<BottomGNav> createState() => _BottomGNavState();
}

class _BottomGNavState extends State<BottomGNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        color: const Color.fromARGB(255, 14, 83, 139),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
              rippleColor:
                  Colors.blue.shade100, // tab button ripple color when pressed
              hoverColor: Colors.blue.shade100, // tab button hover color
              haptic: true, // haptic feedback
              tabBorderRadius: 15,
              tabActiveBorder: Border.all(
                  color: Colors.white, width: 2), // tab button border
              tabBorder: Border.all(
                  color: const Color.fromARGB(255, 14, 83, 139),
                  width: 1), // tab button border
              tabShadow: [
                BoxShadow(color: Color.fromARGB(255, 47, 100, 150).withOpacity(0.2), blurRadius: 8)
              ], // tab button shadow
              curve: Curves.easeOutExpo, // tab animation curves
              duration: const Duration(milliseconds: 900), // tab animation duration
              gap: 8, // the tab button gap between icon and text
              color: const Color.fromARGB(
                  255, 255, 255, 255), // unselected icon color
              activeColor: Colors.white, // selected icon and text color
              iconSize: 24, // tab button icon size
              tabBackgroundColor:
                  Color.fromARGB(255, 0, 0, 0).withOpacity(0.5), // selected tab background color
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 5), // navigation bar padding
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.video_camera_front_rounded,
                  text: 'Videos',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Setting',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                )
              ]),
        ),
      );
  }
}