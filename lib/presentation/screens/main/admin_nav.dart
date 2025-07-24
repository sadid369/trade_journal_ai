import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_navbar/custom_navbar.dart';

class AdminMainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AdminMainScreen({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: navigationShell.currentIndex,
        onTap: (index) => _onTabTapped(context, index),
        icons: const [
          'assets/icons/dashboard.svg',
          'assets/icons/users.svg',
          'assets/icons/settings.svg',
        ],
        labels: const [
          'Dashboard',
          'User',
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
