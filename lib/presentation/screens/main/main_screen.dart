import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_navbar/custom_navbar.dart';

class MainScreenWithBottomNav extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final bool isAdmin; // <-- Add this

  const MainScreenWithBottomNav({
    super.key,
    required this.navigationShell,
    this.isAdmin = true, // <-- Default to false
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: navigationShell.currentIndex,
        onTap: (index) => _onTabTapped(context, index),
        icons: isAdmin
            ? const [
                'assets/icons/dashboard.svg',
                'assets/icons/users.svg',
                'assets/icons/settings.svg',
              ]
            : const [
                'assets/icons/home.svg',
                'assets/icons/search.svg',
                'assets/icons/settings.svg',
              ],
        labels: isAdmin
            ? const [
                'Dashboard',
                'User',
                'Settings',
              ]
            : const [
                'Home',
                'Search',
                'Settings',
              ],
      ),
    );
  }

  void _onTabTapped(BuildContext context, int index) {
    if (navigationShell.currentIndex != index) {
      navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );
    }
  }
}
